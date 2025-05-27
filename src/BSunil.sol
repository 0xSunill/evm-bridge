// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract BSunil is ERC20, Ownable {
    constructor() ERC20("BSunil", "BSUN") Ownable(msg.sender) {
        // _mint(msg.sender, initialSupply);
    }

    function mint(address _to, uint amount) public onlyOwner {
        _mint(_to, amount);
    }
    function burn(address _from, uint amount) public onlyOwner {
        _burn(_from, amount);
    }
}
