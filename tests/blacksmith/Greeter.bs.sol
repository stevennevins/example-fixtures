// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "./Blacksmith.sol";
import "../../src/Greeter.sol";

contract GreeterBS {
    Bsvm constant bsvm = Bsvm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);

    address addr;
    uint256 privateKey;
    address payable proxiedContract;
    
    constructor( address _addr, uint256 _privateKey, address _target) {
        addr = _privateKey == 0 ? _addr : bsvm.addr(_privateKey);
        privateKey = _privateKey;
        proxiedContract = payable(_target);
    }

    modifier prank() {
        bsvm.startPrank(addr, addr);
        _;
    }

    function gm() public prank  {
        Greeter(proxiedContract).gm();
    }

	function greet(string memory _greeting) public prank  {
        Greeter(proxiedContract).greet(_greeting);
    }

	function greeting() public prank returns (string memory) {
        return Greeter(proxiedContract).greeting();
    }

	function owner() public prank returns (address) {
        return Greeter(proxiedContract).owner();
    }

	function renounceOwnership() public prank  {
        Greeter(proxiedContract).renounceOwnership();
    }

	function transferOwnership(address newOwner) public prank  {
        Greeter(proxiedContract).transferOwnership(newOwner);
    }

}
