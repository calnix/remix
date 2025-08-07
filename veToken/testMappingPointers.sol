// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MapPointers {

    
    mapping(address delegate => uint128 lastUpdatedTimestamp) public delegateLastUpdatedTimestamp;
    mapping(address user => uint128 lastUpdatedTimestamp) public userLastUpdatedTimestamp;

    constructor() {
            delegateLastUpdatedTimestamp[msg.sender] = 1;
            userLastUpdatedTimestamp[msg.sender] = 2;
    }


    function getLength(bool isDelegate) public view returns(uint256) {
        
        mapping(address => uint128) storage lastUpdatedMapping = isDelegate ? delegateLastUpdatedTimestamp : userLastUpdatedTimestamp;

        return lastUpdatedMapping[msg.sender];
    }

}