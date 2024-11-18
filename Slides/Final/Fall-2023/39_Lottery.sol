//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.5.0 < 0.9.0;

contract Lottery
{
    //uint participant_count;
    address public manager;
    address payable[] public participants;

    constructor()
    {
        manager = msg.sender;
        //participant_count = 3;
    }

    modifier checkAmount() // Modifiers are internal by default, you cannot use external etc
    {
        require(msg.value >= 0.00000001 ether, "The amount is not sufficient to participate in the Lottery");
        _;
    }

    receive() external payable checkAmount()
    {
        participants.push(payable(msg.sender));
    }

    modifier IsManager()
    {
        require(msg.sender == manager, "You are not the Manager of this Contract");
        _;
    }

    function getBalance() public view IsManager() returns(uint)
    {
        return address(this).balance;
    }

    modifier checkCount()
    {
        require(participants.length >= 3, "The number of Participants is less than the required value (3) ");
        _;
    }

    function random() public view checkCount() returns(uint) 
    {
        bytes memory bytearray = abi.encodePacked(block.timestamp);
        uint rand = uint(keccak256(bytearray)); //keccak256 is a hash function
        //uint rand = uint(sha3(bytearray)); // "sha3" has been deprecated in favour of "keccak256".
        return rand;
    }

    function selectWinner() public IsManager() checkCount() 
    {
        uint rand = random() % participants.length;
        address payable winner;
        winner = participants[rand];
        winner.transfer(getBalance());
        participants = new address payable[](0);
    } 

}

// Modifier is a way to encapsulate reusable logic that can be applied to 
// multiple functions within a contract. Modifiers are used to enforce conditions 
// or checks before or after the execution of a function. 
// They enhance the readability, reusability, and security of smart contract code.