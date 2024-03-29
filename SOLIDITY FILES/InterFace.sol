// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICounter {
   function count() external view returns (uint);
   function incr() external; 
}

contract CallInterface {
    uint public count;

    function example(address _counter) external {
        ICounter(_counter).incr();
        count = ICounter(_counter).count();
    }
}


