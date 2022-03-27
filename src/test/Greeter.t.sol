// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
import "log/console.sol";
import {Greeter, GreeterBS, Blacksmith} from "./blacksmith/Greeter.bs.sol";
import {Errors} from "../Greeter.sol";

contract GreetTest is DSTest {
    Vm internal constant hevm = Vm(HEVM_ADDRESS);
    // contracts
    Greeter internal greeter;
    struct User {
        address addr; // to avoid external call, we save it in the struct
        Blacksmith base;
        GreeterBS greeter;
    }
    User alice;
    User bob;

    function createUser(address _addr, uint256 _privateKey)
        public
        virtual
        returns (User memory)
    {
        Blacksmith base = new Blacksmith(_addr, _privateKey);
        GreeterBS _greet = new GreeterBS(_addr, _privateKey, address(greeter));
        base.deal(100 ether);
        return User(base.addr(), base, _greet);
    }

    function setUp() public virtual {
        greeter = new Greeter();
        alice = createUser(address(0), 111);
        bob = createUser(address(1), 123);
        greeter.transferOwnership(alice.addr);
    }

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

    function testOrigin() public {
        alice.greeter.gm_origin();
    }
}
