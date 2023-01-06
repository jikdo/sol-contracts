// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ERC20.sol";
import "./IERC20.sol";
import "./IERC20Sale.sol";

contract ERC20Sale is ERC20, IERC20Sale {

    function mint() public returns (bool) {
        return true;
    }

    function burn() public returns (bool) {
        return true;
    }

    function price() public view returns (uint256) {

    }
} 