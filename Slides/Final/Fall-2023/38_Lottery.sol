//SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;


contract Lottery
{
    address public manager;
    address payable[] public participants;

    constructor()
    {
        manager = msg.sender;
    }

    receive() external payable
    {
        require(msg.value >= 3 ether); // Enforce conditions, that if not met, 
                                       // trigger an exception and revert any state changes.
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint)
    {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() public view returns(uint)
    {
        bytes memory bytearray = abi.encodePacked(block.timestamp, block.number);
        uint rand = uint(keccak256(bytearray)); //keccak256() is a function
        //uint rand = uint(sha3(bytearray)); // "sha3" has been deprecated in favour of "keccak256".
        // keccak256 function is based on the Keccak cryptographic hash function, also known as SHA-3.
        return rand;
    }

    function selectWinner() public 
    {
        require(msg.sender == manager);
        require(participants.length >= 3);
        uint rand = random() % participants.length;
        
        address payable winner;
        winner = participants[rand];
        winner.transfer(getBalance());
        participants = new address payable[](0);
    } 
}