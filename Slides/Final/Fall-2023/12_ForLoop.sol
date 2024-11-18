// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
//pragma solidity 0.5.0;

contract ForLoop
{
    uint[5] arr; 

    function setValues() public
    {
        for(uint i=0; i<arr.length; i++)
            arr[i] = i*i;

        uint i=0;
        for(; i<arr.length; i++)
            arr[i] = i*i;

        for(; i<arr.length;){
            arr[i] = i*i;
            i++;
        }
    }

    function getValues() public view returns(uint[5] memory){
        return arr;
    }

}

// Solidity does not have a built-in switch statement. 
// However, you can achieve similar functionality if, else if, and else statements. 