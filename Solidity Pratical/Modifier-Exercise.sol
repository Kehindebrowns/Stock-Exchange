// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifierExercise {
    address public owner;
    bool public paused;
    mapping(address => uint) public balance;

    constructor() {
        owner = msg.sender;
        paused = false;
        balance[owner] = 1000;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "This is not the owner");
        _;
    }

    function isPaused() public view returns (bool) {
        return paused;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }
}
