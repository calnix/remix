// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract A {

    uint256 a = 1;


    function testUnderflow() public returns(uint256) {
        uint256 b = 3;

        return a - b;
    }



    function testUnder() public view returns(uint256)  {

        uint256 totalBoostedTokensDelta = (10 * 0) / 10_000;
        return  totalBoostedTokensDelta;
    }

}