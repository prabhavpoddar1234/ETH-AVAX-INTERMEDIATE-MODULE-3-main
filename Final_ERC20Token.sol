// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyCrypto is ERC20, Ownable {
    constructor() ERC20("Ubuntu", "UB") {
        _mint(msg.sender, 50 * 10**18);
    }

    function mintTokens(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address to, uint256 amount) public returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function burnTokens(uint256 amount) external onlyOwner {
        _burn(msg.sender, amount);
    }
}
