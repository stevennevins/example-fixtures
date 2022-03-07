// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import {Fixture1, Fixture2} from "./fixtures/Fixture2.sol";
import "log/console.sol";
import {Errors} from "../contracts/Greeter.sol";

contract Greet is Fixture1 {
    function testCannotGm() public {
        try alice.greet("gm") {
            fail();
        } catch Error(string memory error) {
            assertEq(error, Errors.CannotGm);
        }
    }

    function testCanSetGreeting() public {
        alice.greet("hi");
        console.log(greeter.greeting());
        assertEq(greeter.greeting(), "hi");
    }

    function testWorksForAllGreetings(string memory greeting) public {
        alice.greet(greeting);
        console.log(greeter.greeting());
        assertEq(greeter.greeting(), greeting);
    }
}

contract Gm is Fixture1 {
    function testOwnerCanGmOnGoodBlocks() public {
        hevm.roll(10);
        alice.gm();
        assertEq(greeter.greeting(), "gm");
    }

    function testOwnerCannotGmOnBadBlocks() public {
        hevm.roll(11);
        try alice.gm() {
            fail();
        } catch Error(string memory error) {
            assertEq(error, Errors.InvalidBlockNumber);
        }
    }

    function testNonOwnerCannotGm() public {
        try bob.gm() {
            fail();
        } catch Error(string memory error) {
            assertEq(error, "Ownable: caller is not the owner");
        }
    }
}

contract Greet2 is Fixture2 {
    function testCannotGm() public {
        try alice.greet("gm") {
            fail();
        } catch Error(string memory error) {
            assertEq(error, Errors.CannotGm);
        }
    }

    function testCanSetGreeting() public {
        alice.greet("hi");
        console.log(greeter.greeting());
        assertEq(greeter.greeting(), "hi");
    }

    function testWorksForAllGreetings(string memory greeting) public {
        alice.greet(greeting);
        console.log(greeter.greeting());
        assertEq(greeter.greeting(), greeting);
    }
}

contract Gm2 is Fixture2 {
    function testOwnerCanGmOnGoodBlocks() public {
        hevm.roll(10);
        alice.gm();
        assertEq(greeter.greeting(), "gm");
    }

    function testOwnerCannotGmOnBadBlocks() public {
        hevm.roll(11);
        try alice.gm() {
            fail();
        } catch Error(string memory error) {
            assertEq(error, Errors.InvalidBlockNumber);
        }
    }

    function testNonOwnerCannotGm() public {
        try bob.gm() {
            fail();
        } catch Error(string memory error) {
            assertEq(error, "Ownable: caller is not the owner");
        }
    }
}
