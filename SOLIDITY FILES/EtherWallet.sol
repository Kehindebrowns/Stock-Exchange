// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Only owner can withdraw");
        require(address(this).balance >= _amount, "Insufficient balance");

        payable(msg.sender).transfer(_amount);
    }

    function getValue() external view returns (uint) {
        return address(this).balance;
    }
}


      

    

