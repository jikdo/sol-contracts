// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "./IERC20.sol";

contract ERC20 is IERC20 {

    string public _name;
    string public _symbol;
    uint8 public _decimals;
    uint256 public _totalSupply;
    mapping(address => uint256) balance;
    mapping(address => mapping(address => uint256)) _allowance;


    constructor(string memory name, string memory _symbol, uint8 _decimals, uint8  _totalSupply) {
        _name = _name;
        _symbol = _symbol;
        _decimals = _decimals;
        _totalSupply = _totalSupply;

        // transfer to msg.sender
        balance[msg.sender] = _totalSupply;
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

    function balanceOf(address _owner) public view returns (uint256) {
        return balance[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balance[msg.sender] >= _value, 'Not enough balance');

        balance[msg.sender] -= _value;
        balance[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(balance[_from] >= _value, 'Not enough balance from _from');
        require(_allowance[_from][msg.sender] >= _value, 'Not enough allowance');

        balance[_from] -= _value;
        balance[_to] += _value;

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(balance[msg.sender] >= _value, 'Not enough balance');
        _allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return _allowance[_owner][_spender];
    }
}