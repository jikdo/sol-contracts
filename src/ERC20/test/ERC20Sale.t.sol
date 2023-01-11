// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "../../../lib/forge-std/src/Test.sol";
import "../ERC20Sale.sol";

contract ERC20SaleTest is Test {
    ERC20Sale public sale;

    function  setUp() public {
        sale = new ERC20Sale('TestToken', 'TT', 18, 25000000000000000000000, 500000000000000000);
    }

    function testGetPrice() public {
        assertEq(sale.getPrice(), 500000000000000000);
    }

    function testBuy() public payable {
        vm.startPrank(0x6F79E176f0B7ecc7948E4E32d676D5267131b77A);
        (bool sent, bytes memory data) = address(sale).call{value: msg.value}(
            abi.encodeWithSignature("buy()")
        );
        
        assertEq(sale.balanceOf(msg.sender), msg.value / sale.getPrice());
    }
}