// SPDX-License-Identifier: GPL-3.0

//pragma solidity >= 0.7.0 < 0.8.1;
pragma solidity ^0.8.0;

contract Identity
{
    string name;
    uint age; 

    //constructor(){}
    constructor(uint _age, string memory _name){
        name = _name;
        age = _age;
    }

}