// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PaymentHandler {
 address public payable owner;   
event PaymentReceived(address indexed _from, uint256 amount);

    function receivePayment() external payable {
        require(msg.value >= 0, "Payment must be greater than 0");
        
emit PaymentReceived(msg.sender, msg.value);
    }

    function withdrawl() external {
        uint256 amountToWithdraw = 1 ether; 
        require(address(this).balance >= amountToWithdraw, "Insufficient balance");
       
        (bool success,) = msg.sender.call{value: amountToWithdraw}("");
        require(success, "Withdrawal failed");
    }
}
