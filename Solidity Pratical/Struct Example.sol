// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // Define a struct named 'Person'
    struct Person {
        string name;
        uint age;
    }

    // Declare a state variable of type 'Person'
    Person public myPerson;

    // Constructor to initialize the 'myPerson' variable
    constructor(string memory _name, uint _age) {
        myPerson = Person(_name, _age);
    }
}
