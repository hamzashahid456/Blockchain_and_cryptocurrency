//SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract Base1 {
    constructor() {}
}

contract Base2 {
    constructor() {}
}

// Constructors are executed in the following order:
//  1 - Base1
//  2 - Base2
//  3 - Derived1
contract Derived1 is Base1, Base2 {
    constructor() Base2() Base1() { //This order not matters
    }
}

// Assigning value to Parent attribute 
contract Shape {
    uint public x;
    constructor(uint x_) { x = x_; }
}

// Directly specify in the inheritance list
contract Square is Shape(4) {
    constructor() {}
}

// Through a "modifier" of the derived constructor.
contract Traingle is Shape {
    constructor(uint v) Shape(v * v) {}
}

// Languages that allow multiple inheritance have to deal with several problems. 
// One is the Diamond Problem. Solidity is similar to Python in that it uses “C3 Linearization” 
// to force a specific order in the directed acyclic graph (DAG) of base classes. 
// This results in the desirable property of monotonicity but disallows some inheritance graphs.