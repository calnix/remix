   // SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract arrays {

   
    function claimMultiple() public view returns(uint256) {

        uint128[] memory rounds;

        uint256 roundsLength = rounds.length;
        //if(roundsLength == 0) revert (); 

        return roundsLength;
    }


    function testNested() public pure returns(uint256) {

        // no "free-sizing" in memory.
        // must init the nested array w/ a specified length.
        
        uint256[][4] memory values; // [ [], [] ]

        values[0] = new uint256[](2);
        values[1] = new uint256[](3);

        //values[0] = [uint256(1), 2] will not work
        values[0][0] = 1;
        values[0][1] = 2;

        //value[1]: len 3
        values[1][0] = 3;
        values[1][1] = 4;
        values[1][2] = 5;

        // [ [1,2], [3,4,5] ]
        
        return values[1][2];
    }
    
    // values[0][1]: returns 2
    // values[1][1]: returns 4
    // values[1][2]: returns 5
    
    
}