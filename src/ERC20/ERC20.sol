// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    string public _name;
    string public _symbol;
    uint8 public _decimals;
    uint256 public _totalSupply;
    mapping(address => uint256) balance;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint8  _totalSupply) {
        _name = _name;
        _symbol = _symbol;
        _decimals = _decimals;
        _totalSupply = _totalSupply;

        // transfer to msg.sender
        balance[msg.sender] = _totalSupply
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(_owner) public view returns (uint256) {
        return balance[_owner];
    }
}