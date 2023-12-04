// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fundings {
    uint[] public arr;
    uint[] public fixedNum = [1, 2, 3, 4, 5, 6];

    function remove(uint _index) public {
        require(_index < arr.length, "Index out of bound");
        for (uint i = _index; i < arr.length; i++) {
            arr.pop();
        }
    }

    function test() external {
        arr = [1, 2, 3, 4, 5, 6];
        remove(3);
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
    }
}

contract DataLocation {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples() public  returns (uint, string memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: 'bar'});
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;
        return (readOnly.foo, readOnly.text);
    }
}


