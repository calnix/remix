// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

contract TestStorageArray {

    uint256[] public activeDistributions;    // array stores key values for distributions mapping; includes not yet started distributions  

    constructor(){

        activeDistributions.push(0);
        activeDistributions.push(1);
        activeDistributions.push(2);
    }

    function ret() public view returns(uint256){
        return activeDistributions.length;
    }
    
        
}
    
