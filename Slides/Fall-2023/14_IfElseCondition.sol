// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
//pragma solidity 0.5.0;

contract IfElse
{

   function returnGreater(uint num1, uint num2) public pure returns(uint) {
        if( num1 > num2)
            return num1;
        else if (num2 > num1)
            return num2;
        else
            return 0;

    }

}