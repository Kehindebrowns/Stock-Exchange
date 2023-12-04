// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageFull {
    address public owner;

    enum Status {
        StoreIt,
        ReceiveIt,
        SendIt,
        TransactIt
    }

    Status public status;
    uint256 public count;

    constructor() {
        status = Status.StoreIt;
    }

    function getCount() public view returns (uint) {
        return count;
    }

    function incrementCount() public {
        count++;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == owner;
    }

    struct Storage {
        uint256 id;
        uint256 received;
        string send;
        string transact;
        string store;
    }

    mapping(address => Storage) public myStorage;

    function getStorage() public view returns (uint256 id, uint256 received, string memory send, string memory transact, string memory store) {
        Storage storage item = myStorage[msg.sender];
        return (item.id, item.received, item.send, item.transact, item.store);
    }
}

