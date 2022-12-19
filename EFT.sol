//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EFT {
    string public name = "Ever Finance Token";
    string public symbol = "EFT";
    uint8 public decimals = 2;
    uint256 public totalSupply = 10000000000;

    // Mapeamento de endereços para saldos
    mapping (address => uint256) public balances;

    // Um evento que é acionado sempre que ocorre uma transferência
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

    // Inicializa o contrato com o fornecimento total de EFT
    constructor() {
        balances[msg.sender] = totalSupply;
    }

    // Transfere uma quantidade especificada de EFT de um endereço para outro
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

    // Retorna o saldo de um endereço especificado
    function balanceOf(address owner) public view returns (uint256 balance) {
        return balances[owner];
    }
}
