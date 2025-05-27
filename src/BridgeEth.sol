// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "forge-std/console.sol"
contract BridgeEth is Ownable {
    uint256 public balance;
    address public tokenAddress;

    event Deposit(address indexed depositor, uint amount);

    mapping(address => uint256) public pendingBalance;

    constructor(address _tokenAddress) Ownable(msg.sender) {
        tokenAddress = _tokenAddress;
    }
    function deposit(IERC20 _tokenAddress, uint256 _amount) public {
        require(address(_tokenAddress) == tokenAddress);
        require(_tokenAddress.allowance(msg.sender, address(this)) >= _amount);
        require(_tokenAddress.transferFrom(msg.sender, address(this), _amount));
        emit Deposit(msg.sender, _amount);
    }
    function withdraw(IERC20 _tokenAddress, uint256 _amount) public {
        require(pendingBalance[msg.sender] >= _amount);
        pendingBalance[msg.sender] -= _amount;
        _tokenAddress.transfer(msg.sender, _amount);
    }
    function burnedOnOppositeChain(
        address userAccount,
        uint256 _amount
    ) public onlyOwner {
        pendingBalance[userAccount] += _amount;
    }
}
