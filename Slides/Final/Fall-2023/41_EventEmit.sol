// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Receiver {
    event Received(address caller, uint amount, string message);

    receive() external payable {
        emit Received(msg.sender, msg.value, "Receive was called");
    }

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;
    }
}

// Events and the emit keyword are used to enable communication and logging 
// between smart contracts and external applications. 
// To see logs, go to transaction and search for logs