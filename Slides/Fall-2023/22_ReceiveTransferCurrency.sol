// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
//pragma solidity 0.5.0;

contract ReciveTransfer
{
    address payable sourceAddress = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    function payCurrency() public payable{ // Just make a method payable to recieve money into Contract Account (CA)
        // Should be public as this method is called from outside
    }

    function getBalance() view public returns(uint){
        return address(this).balance; // This is how to return balance of Contract Account (CA)
                                       // Coversion to address is required to call balance attribute
    }

    function transferCurrency() public  { // Maybe public or private as this method is called from inside as well as outside
        sourceAddress.transfer(1 ether);
        sourceAddress.transfer(1 wei);
        sourceAddress.transfer(1 gwei);
        // Note: Remember you can transfer only when you have sufficient amount in CA
    }
}