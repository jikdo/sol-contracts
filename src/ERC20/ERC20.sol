// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "./IERC20.sol";

contract ERC20 is IERC20 {

    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) _allowed;


    constructor(string memory _tokenName, string memory _tokenSymbol, uint8 _decimalUnits, uint256  _initialSupply) {
        _name = _tokenName;
        _symbol = _tokenSymbol;
        _decimals = _decimalUnits;
        _totalSupply = _initialSupply;

        // transfer to msg.sender
        _balances[msg.sender] = _totalSupply;
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
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_balances[msg.sender] >= _value, 'Not enough balance');

        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_balances[_from] >= _value, 'Not enough balance from _from');
        require(_allowed[_from][msg.sender] >= _value, 'Not enough allowance');

        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowed[_from][msg.sender] -= _value;

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_balances[msg.sender] >= _value, 'Not enough balance');
        _allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return _allowed[_owner][_spender];
    }
}