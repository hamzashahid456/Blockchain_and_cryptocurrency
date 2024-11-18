// SPDX-License-Identifier: GPL-3.0

//pragma solidity >= 0.7.0 < 0.8.1;
pragma solidity ^0.8.0;

contract Identity
{
    string public name;
    uint public age; 

    function getValue(uint valueArg) public pure returns(uint){
        uint value = 10;
        return value + valueArg;
    }     
}