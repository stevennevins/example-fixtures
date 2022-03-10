// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import {Fixture1, Fixture2} from "./fixtures/Fixture2.sol";
import "log/console.sol";
import {Errors} from "../src/Greeter.sol";

contract Greet is Fixture1 {
    function testCannotGm() public {
        try alice.greeter.greet("gm") {
            fail();
        } catch Error(string memory error) {
            assertEq(error, Errors.CannotGm);
        }
    }

    function testCanSetGreeting() public {
        alice.greeter.greet("hi");
        console.log(greeter.greeting());
        assertEq(greeter.greeting(), "hi");
    }

    function testWorksForAllGreetings(string memory greeting) public {
        alice.greeter.greet(greeting);
        console.log(greeter.greeting());
        assertEq(greeter.greeting(), greeting);
    }
}

contract Greet2 is Fixture2 {
    function testCannotGm() public {
        try alice.greeter.greet("gm") {
            fail();
        } catch Error(string memory error) {
            assertEq(error, Errors.CannotGm);
        }
    }

    function testCanSetGreeting() public {
        alice.greeter.greet("hi");
        console.log(greeter.greeting());
        assertEq(greeter.greeting(), "hi");
    }

    function testWorksForAllGreetings(string memory greeting) public {
        alice.greeter.greet(greeting);
        console.log(greeter.greeting());
        assertEq(greeter.greeting(), greeting);
    }
}
