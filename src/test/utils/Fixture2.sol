// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Fixture1.sol";

abstract contract GreeterTest is Fixture1 {
    function setUp() public virtual override {
        super.setUp();
    }
}
