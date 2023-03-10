// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "../../../lib/forge-std/src/Test.sol";
import "../ERC20.sol";

contract ERC20Test is Test {
    ERC20 public token;

    function setUp() public {
        token = new ERC20('TestToken', 'TT', 18, 25000000000000000000000);
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
   
        assertEq(token.balanceOf(address(this)), 25000000000000000000000);
    }

    function testTransfer() public {
        uint256 fromBalanceBefore = token.balanceOf(address(this));
        uint256 toBalanceBefore = token.balanceOf(address(0));
        token.transfer(address(0), 20e18);

        assertEq(token.balanceOf(address(0)), toBalanceBefore + 20e18);
        assertEq(token.balanceOf(address(this)), fromBalanceBefore - 20e18);

    }

    function testTransferFromAndApprove() public {
        token.transfer(address(0), 40e18);
        uint256 fromBalanceBefore = token.balanceOf(address(0));
        uint256 toBalanceBefore = token.balanceOf(address(this));
        vm.prank(address(0));
        token.approve(address(this), 20e18);
        token.transferFrom(address(0), address(this), 20e18);

        assertEq(token.balanceOf(address(this)), toBalanceBefore + 20e18);
        assertEq(token.balanceOf(address(0)), fromBalanceBefore - 20e18);

    }

    function testAllowance() public {
        token.transfer(address(0), 40e18);
        uint256 fromBalanceBefore = token.balanceOf(address(0));
        uint256 toBalanceBefore = token.balanceOf(address(this));
        vm.prank(address(0));
        token.approve(address(this), 20e18);

        assertEq(token.allowance(address(0), address(this)), 20e18);
    } 

}