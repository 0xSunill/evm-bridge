// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Sunil is ERC20, Ownable {
    constructor() ERC20("Sunil", "SUN") Ownable(msg.sender) {}

    function mint(address _to, uint amount) public onlyOwner {
        _mint(_to, amount);
    }
}
