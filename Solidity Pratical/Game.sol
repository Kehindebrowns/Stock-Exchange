// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IUser {
    function createUser(address userAddress, string memory username)extenal; {
}
 }
  contract Game {
    uint public gameCount;
    IUser public userContract;
    constructor(address_userContactAddress){
        userContact =IUser(_userContactAddress);
    }
    function startGame(string memeory username)external {
        gameCount++;
        userContact.craeteUser(msg.sender,username);
    }
  }