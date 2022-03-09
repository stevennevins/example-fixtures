// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Fixture1.sol";

abstract contract Fixture2 is Fixture1 {
    function setUp() public virtual override {
        super.setUp();
    }
}
