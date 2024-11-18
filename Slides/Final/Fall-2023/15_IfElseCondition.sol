// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
//pragma solidity 0.5.0;

contract IfElse
{

   function returnGreater(uint num1, uint num2) public pure returns(string memory) {
        if( num1 > num2)
            return string(abi.encodePacked(num1, " is greater"));
        else if (num2 > num1)
            return string(abi.encodePacked(num2, " is greater"));
        else
            return "Equal Numbers";
    }

   function returnEqualTernary(uint num1, uint num2) public pure returns(string memory) {        
        return ( num1 == num2? "Equal" : "Not Equal");
    }

}