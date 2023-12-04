// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract SampleContract {
    address payable public seller;
    address payable public buyer;
    uint public price;

    constructor(uint _price) {
        seller = payable(msg.sender);
        price = _price;
    }

    function transfer(address _buyer) internal {
        require(msg.sender == seller, "Only the seller can initiate the transfer");
        require(_buyer != address(0), "Invalid buyer address");
        require(address(this).balance >= price, "Insufficient balance for transfer");
        
        _send.transfer(price);
    }

    function getSeller() public view returns (address) {
        return seller;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == seller;
    }

    function isReceived() public view returns (bool) {
        return address(this).balance >= price;
    }
}
