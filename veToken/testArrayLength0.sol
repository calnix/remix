// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Araay {

    struct VeBalance{
        uint256 bias;
        uint256 slope;
    }

    mapping(address user => VeBalance[] vePoints) public userHistory;


    function getLength() public view returns(uint256) {
        
        VeBalance memory userVeBalance = userHistory[msg.sender][userHistory[msg.sender].length - 1];

        return userHistory[msg.sender].length;
    }

}