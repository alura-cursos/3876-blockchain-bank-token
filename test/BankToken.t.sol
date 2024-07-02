// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "@lib/forge/src/Test.sol";
import "../src/BankToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// Arrange, Act, Assert

interface CheatCodes {
    function startPrank(address) external;
    function stopPrank() external;
    function expectRevert() external;
}

contract BankTokenTest is Test {
    BankToken private btk;
    CheatCodes cheats = CheatCodes(VM_ADDRESS);

    address defaultOwner = address(1);
    address notAuthorizedMinter = address(3);
    uint256 initialSupply = 1000 * 1e18;

    function setup() {
        cheats.startPrank(defaultOwner);
        btk = new BankToken(defaultOwner, initialSupply);
        cheats.stopPrank();
    }

}
