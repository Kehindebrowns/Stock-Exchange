// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {
    uint256 public MAX_TWEET_LENGTH;
    uint256 public tweetCount;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    event NewUserName(address indexed registeredUser, string username);
    event CreatedTweet(uint256 id, address author, string content, uint256 timestamp, uint256 likes);
    event LikedTweet(uint256 id, address author, string content, uint256 timestamp, uint256 likes);
    event UnlikedTweet(uint256 id, address author, string content, uint256 timestamp, uint256 likes);

    mapping(address => Tweet[]) public tweets;
    mapping(address => bool) public isUserRegistered;

    modifier onlyUser() {
        require(isUserRegistered[msg.sender], "Only a registered user can call this function");
        _;
    }

    constructor(uint256 _maxTweetLength) {
        MAX_TWEET_LENGTH = _maxTweetLength;
        tweetCount = 0;
    }

    function registerUser(string memory _username) public {
        require(!isUserRegistered[msg.sender], "User is already registered");
        isUserRegistered[msg.sender] = true;
        emit NewUserName(msg.sender, _username);
    }

    function createTweet(string memory _content) public onlyUser {
        require(bytes(_content).length <= MAX_TWEET_LENGTH, "Tweet length exceeds the maximum allowed length");
        tweets[msg.sender].push(Tweet({
            id: tweetCount,
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0
        }));
        emit CreatedTweet(tweetCount, msg.sender, _content, block.timestamp, 0);
        tweetCount++;
    }

    function addLikeToTweet(uint256 _id) external onlyUser {
        require(_id < tweets[msg.sender].length, "Tweet with this ID does not exist");
        tweets[msg.sender][_id].likes++;
        emit LikedTweet(_id, msg.sender, tweets[msg.sender][_id].content, block.timestamp, tweets[msg.sender][_id].likes);
    }

    function unlikeTweet(uint256 _id) external onlyUser {
        require(_id < tweets[msg.sender].length, "Tweet with this ID does not exist");
        require(tweets[msg.sender][_id].likes > 0, "The tweet has no likes");
        tweets[msg.sender][_id].likes--;
        emit UnlikedTweet(_id, msg.sender, tweets[msg.sender][_id].content, block.timestamp, tweets[msg.sender][_id].likes);
    }

    function getTweet(address _owner, uint256 _id) public view returns (Tweet memory) {
        require(_id < tweets[_owner].length, "Tweet with this ID does not exist");
        return tweets[_owner][_id];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}



   
   

   