//SPDX-License-Identifier: Apache-2.0

//a simple smart contract that simulates a bank system 

pragma solidity ^0.8.11;

contract Bank{
    mapping(address => uint) public balances;

    function deposite() external payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw(address payable addr, uint amount) public payable{
        require(balances[addr] >= amount,"Insufficient balance");
        (bool sent, bytes memory data) = addr.call{value: amount}("");
        require(sent, "Cannot send money");
        balances[msg.sender] -= amount;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}