// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Araay {

    struct VeBalance{
        uint256 bias;
        uint256 slope;
    }

    mapping(bytes32 lockId => VeBalance[] vePoints) public lockHistory;
    mapping(address user => VeBalance[] vePoints) public userHistory;


    function pushCheckpoint(VeBalance[] storage lockHistory) internal {

    }


}