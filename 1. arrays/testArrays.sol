// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract arrays {

    uint256[] public arr;

    function push() public {
        
        arr.push(1);
    }

    function test() public {

        uint256[] memory testarr = new uint256[](2);
        
        
        testarr[0] = 32;
        testarr[1] = 32;

        arr = testarr;
    }


    function test2() public {

        uint256[] memory cacheArr = new uint256[](arr.length);
        
        cacheArr = arr;
        
        for(uint256 i; i < arr.length; ++i){
            cacheArr[i] = 
        }
     

        
    }
}