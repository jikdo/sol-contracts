// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IERC20Sale {
    function buy() external payable  returns (bool success);
    function getPrice() external view returns (uint256);
}