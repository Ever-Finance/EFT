//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

// Name of the token
string public name = "Ever Finance Token";

// Symbol of the token
string public symbol = "EFT";

// Number of decimal places for the token
uint8 public decimals = 2;

// Total supply of the token
uint256 public totalSupply = 100000000;

// ERC20 contract from OpenZeppelin
ERC20 public token;

// Constructor function
constructor() public {
    // Create the ERC20 token
    token = new ERC20(name, symbol, decimals, totalSupply);

    // Transfer all tokens to the contract owner
    token.transfer(msg.sender, totalSupply);
}
