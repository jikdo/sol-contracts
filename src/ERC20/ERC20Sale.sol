// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ERC20.sol";
import "./IERC20.sol";
import "./IERC20Sale.sol";

contract ERC20Sale is ERC20, IERC20Sale {
    uint256 public price;

    constructor (
        string memory _tokenName,
        string memory _tokenSymbol,
        uint8 _decimalUnits,
        uint256  _initialSupply,
        uint256 _price
    ) 
    ERC20 (
        _tokenName,
        _tokenSymbol,
        _decimalUnits,
        _initialSupply
    ) {
        price = _price;
    }

    function mint() public returns (bool) {
        return true;
    }

    function burn() public returns (bool) {
        return true;
    }

    function getPrice() public view returns (uint256) {
        return price;
    }
} 