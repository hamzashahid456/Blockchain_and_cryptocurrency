//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.5.0 < 0.9.0;

abstract contract Animal {
    function speak() public pure virtual returns (string memory);
}

contract Dog is Animal {
    function speak() public pure override returns (string memory) { 
        return "Bow Bow"; 
    }
}

abstract contract Cow is Animal {
//contract Cow is Animal {
    //function speak() public pure override returns (string memory); // Still must be abstract
    //function speak() public pure override returns (string memory){}
}

// Contracts must be marked as abstract when at least one of their functions is not implemented 
// or when they do not provide arguments for all of their base contract constructors. 
// Even if this is not the case, a contract may still be marked abstract, 
// such as when you do not intend for the contract to be created directly. 
// Abstract contracts are similar to Interfaces but an interface is more limited in what it can declare.