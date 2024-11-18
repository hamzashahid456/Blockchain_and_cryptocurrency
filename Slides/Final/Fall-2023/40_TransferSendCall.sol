//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.5.0 < 0.9.0;

//transfer vs send vs call
contract TransferSendCall
{
    bytes public dataVal;

    function depositUsingTransfer(address payable _to) public payable
    {
        _to.transfer(msg.value); //2300 gas // Automatically throws an exception on failure.
    }

    function depositUsingSend(address payable _to) public payable
    {
        bool send = _to.send(msg.value); //2300 gas // Similar to transfer but does not automatically 
        // throw an exception on failure. however, returns a boolean indicating success or failure. 
        require(send, "Failure! Ether not sent");
    }

    function depositUsingCall(address payable _to) public payable
    {
        // Most flexible method, allowing customization of gas, value, and arbitrary data.
        
        //(bool send, )  = _to.call{value: address(this).balance}(""); // Style-1
        //(bool send, bytes memory data) = payable(_to).call{value: msg.value}(""); // Style-2

        (bool send, bytes memory data) = _to.call{gas :0, value: msg.value}("func_signature(uint256 args)"); //// Style-3
        require(send, "Failure! Ether not sent");
        dataVal = data;
    }
}
