// SPDX-Lisence-Identifier
pragma solidity ^0.8.0;

contract Storage{
 address public owner;
  mapping (address => Storage) myStorage;
  struct examples myStruct () external {
    uint address;
  }
  Mystruct[msg.sender]=myStruct({address:msg.sender});
 
}
// event
contract Event {
      event Log(string message,uintval);
      event IndexedLog(address IndexedLog, uintval);

      function example()extenal{
        emit log("foo","1234");
        emit log('msg.sender',234);
      }
      event message(address message_from,address message_to,string memory);
      function sendMessage(address _to,string calldata message)external{
        emit message(msg.sender,_to,message)
      } 
    }


    // Inheritance


  contract E{
    event type('string message' );
    function foo extenal() public vitual{
      emit.log(E:foo);
      E.foo();

      function bar external() public override{
        emit.log(E:foo);
        super.bar();
      }
    }
  }
  // is function is used when you want to be able to inherit the initial function...
  // then you include the function the initial function...


    



  

  


