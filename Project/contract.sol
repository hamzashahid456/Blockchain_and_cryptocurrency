// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharityManagement {
    address public owner;
    mapping(address => uint256) public donations;

    event DonationReceived(address indexed donor, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function donate() external payable {
        require(msg.value > 0, "Donation amount must be greater than 0");
        
        donations[msg.sender] += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    function withdraw() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}

