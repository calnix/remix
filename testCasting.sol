// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract RouterOnPool {

    uint public num;

    function cast() public view returns(uint128) {
        
        //num = type(uint256).max;

        return uint128(type(uint256).max);
    }

}