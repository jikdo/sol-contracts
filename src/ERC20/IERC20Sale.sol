// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IERC20Sale {
    function mint() external returns (bool success);
    function burn() external returns (bool success);
    function price() external view returns (uint256);
}