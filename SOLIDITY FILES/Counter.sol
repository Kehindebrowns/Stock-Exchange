// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint count;

    // Function to retrieve the current count
    function getCount() public view returns (uint) {
        return count;
    }

    // Function to increment the count
    function incrementCount() public {
        count = count + 1;
    }
}
