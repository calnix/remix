// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract A {


    function test(uint256 distributionStartTime, uint256 distributionEndTime, uint256 emissionPerSecond) public returns(uint256) {
        uint256 mul = (distributionEndTime - distributionStartTime) * emissionPerSecond;
    }


    function test2(uint256 nftFeeFactor, uint256 creatorFeeFactor, uint256 realmPointsFeeFactor) external pure returns(int256) {
        oldCreatorFeeFactor = 1000;

        if(totalFeeFactor > 5000) revert();     //e.g.: 50% = 5000/10_000 = 5000/PRECISION_BASE

        if(creatorFeeFactor > oldCreatorFeeFactor) revert();

        //return type(int256).max;
    }
}