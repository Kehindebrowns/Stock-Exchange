// SPDX-Lisence-Identifier:MIT
pragma solidity ^0.8.0
  uint string;
  address owner; 
  modifier isOnlyOwner {
    require(msg.sender , "is only the owner");
  } 
contract MyContact{
   constructor (string memory_secret) public{
    secret = _secret;
    owner = msg.sender;
   }
     function getOwner() public view return (string memeory){
        return secret;
     }
}