// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract VulnerableDAO
{
    mapping(address => uint256) public balances;

    function deposit() public payable
    {
        balances[msg.sender] += msg.value;
    }
 
    function withdraw() public
    {
        uint bal = balances[msg.sender];
        require(bal > 0);

        (bool success, ) = msg.sender.call{value: bal}(""); 
        require(success, "Failed to send Ether");
        
        balances[msg.sender] = 0;
    }

    // Função para verificar o saldo do contrato
    function getBalance() public view returns (uint256)
    {
        return address(this).balance;
    }
}