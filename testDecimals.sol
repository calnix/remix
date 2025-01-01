// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract testDeci {

    uint256 public boosted = 2E18 * 1.1;
    
    uint256 public factor = 1.1 * 1E18;

    uint256 public boostedBal = (2e18 * factor) / 1e18;



}