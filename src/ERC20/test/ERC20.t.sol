// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "../../../lib/forge-std/src/Test.sol";
import "../ERC20.sol";

contract ERC20Test is Test {
    ERC20 public token;

    function setUp() public {
        token = new ERC20('TestToken', 'TT', 18, 25000000000000000000000);
        console.log(msg.sender);
    }

    function testName() public {
        assertEq(token.name(), 'TestToken');
    }

    function testSymbol() public {
        assertEq(token.symbol(), 'TT');
    }

    function testDecimals() public {
        assertEq(token.decimals(), 18);
    }

    function testTotalSupply() public {
        assertEq(token.totalSupply(), 25000000000000000000000);
    }

    function testCreaterReceivedInitialSupply() public {
        console.log(token.balanceOf(address(this)));
        console.log(msg.sender);
        assertEq(token.balanceOf(address(this)), 25000000000000000000000);
    }
}