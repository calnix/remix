// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract TestArrayRreturn {

    struct UserInfo {
        uint256 test;
        uint256[] tokenIds;   
    }

    mapping(uint256 => UserInfo) public test;

    constructor(){
        UserInfo memory user; 
            user.test = 1;
        
        test[0] = user;
    }

    
        
}
    
