//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EFT {
    string public name = "Ever Finance Token";
    string public symbol = "EFT";
    uint8 public decimals = 2;
    uint256 public totalSupply = 10000000000;

    // Mapping from addresses to balances
    mapping (address => uint256) public balances;

    // An event that is triggered whenever a transfer occurs
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

    // Initializes the contract with the total supply of EFT
    constructor() {
        balances[msg.sender] = totalSupply;
    }

    // Transfers a specified amount of EFT from one address to another
    function transfer(
        address recipient,
        uint256 amount
    ) public returns (bool success) {
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // Returns the balance of a specified address
    function balanceOf(address owner) public view returns (uint256 balance) {
        return balances[owner];
    }
}
