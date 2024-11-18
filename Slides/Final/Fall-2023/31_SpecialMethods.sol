//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.5.0 < 0.9.0;

contract Payment
{
    address payable user = payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
    
    //function pay() public payable
    //{}

    receive() external payable{
        //user.transfer(1000000000000000000); // 1 Ether = 10^18 Wei // You can receive in CA and then transfer to user, transfering amount should be less than CA balance.
        // A special function, automatically called when a contract receives Ether without any data. 
        // Defined with the receive keyword, take no arguments and no return type.
    }

    //fallback() external{
        // The fallback function always receives data (Call Data)
    //}

    fallback() external payable{  // But to also receive Ether, you should mark it as payable. 
        // Called when a contract is sent Ether and the transaction doesn't match any existing function 
        // When a contract is sent Ether with data but doesn't have a receive function.   
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function transfer() public payable{
         //user.transfer(1000000000000000000); // 1 Ether = 10^18 Wei
         //user.transfer(100); //Default in wei
         user.transfer(1 ether); //Transfer from CA, so balance of CA should be greater 
    }

    function transferDirectly() public payable{ // Should be payable
         user.transfer(msg.value); //Transfer from A 2 B, bypassing CA 
    }
}

// The absence of the function keyword in receive and fallback is a design choice 
// to keep the syntax clean and specific within the context of Ethereum transactions