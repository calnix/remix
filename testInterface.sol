// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface Imodule {

    // this is view!
    function test(uint256 x) external view returns (uint256);

}

contract Module {

    uint256 public storageVar;

    // this is not view!!
    function test(uint256 x) public view returns(uint256) {

        revert();

        return x;
    }

}


contract Caller {

    address public mod;

    function set(address m) public {
        mod = m;
    }

    // this is not view!!
    function call(uint256 x) public returns (uint256) {

        return Imodule(mod).test(x);

    }

}