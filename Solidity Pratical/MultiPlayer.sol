// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiPlayer {
    struct Player {
        uint256 id;
        address uPlayer;
        string description;
    }

    mapping(address => Player[]) public players;
    uint256[] public jointGames;

    function joinGame(uint256 _id, address _user, string memory _description) public {
        Player memory newPlayer = Player(_id, _user, _description);
        players[_user].push(newPlayer);
        jointGames.push(_id);
    }

    function getAllPlayers() public view returns (uint256[] memory) {
        return jointGames;
    }
}

contract Player is MultiPlayer {
    struct Game {
        uint256 id;
        bool isWinner;
    }

    mapping(address => Game[]) public games;

    function addPlayer() public {
        uint256 playerId = players[msg.sender].length;
        Game memory newGame = Game(playerId, true);
        games[msg.sender].push(newGame);
    }
}

 