// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
//pragma solidity 0.5.0;

contract StorageStorage
{
    uint8[5] stateArray = [1, 2, 3, 4, 5];

    function getArrays() public returns(uint8[5] memory stateArr, uint8[5] memory localMemArr){
        uint8[5] storage localArray = stateArray;
        localArray[4] = 99;
        return (stateArray, localArray);

        // Methods that are not marked as view or pure are considered to modify the state
        // To view the record of such methods and their state changing use other mehods
    }

    function getArraysView() public view returns(uint8[5] memory stateArr){
        return (stateArray); 
        //return (stateArray, localArray); // localArray does not exist here
    }
}