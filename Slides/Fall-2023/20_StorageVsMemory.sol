// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
//pragma solidity 0.5.0;

contract StorageMemory
{
    uint8[5] stateArray = [1, 2, 3, 4, 5];

    function getArrays() public view returns(uint8[5] memory stateArr, uint8[5] memory localMemArr){
        uint8[5] memory localArray = stateArray;
        localArray[4] = 99;
        return (stateArray, localArray);
    }

}