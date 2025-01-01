// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Counter {
    uint public count;
    uint256 internal count2;

    // Function to get the current count
    function get() public view returns (uint) {
        return count;
    }
    
    function get2() public view returns (uint) {
        return count2;
    }

    // Function to increment count by 1
    function inc() public {
        count += 1;
    }
    
    function inc2() public {
        count2 += 1;
    }

    // Function to decrement count by 1
    function dec() public {
        count -= 1;
    }

    address user1;
    address user2;

    function msg1() public returns(uint256,uint256,uint256) {
        uint256 initialGas = gasleft();

        user1 = msg.sender;
        user2 = msg.sender;

        uint256 finalGas = gasleft();
        uint256 gasUsed = initialGas - finalGas; 

        return (initialGas, finalGas, gasUsed);
    }

    /*
	    "0": "uint256: 9127",
	    "1": "uint256: 4588",
	    "2": "uint256: 4539"
    */

    function msg2() public returns(uint256,uint256,uint256) {
        uint256 initialGas = gasleft();

        address cache = msg.sender;
        
        user1 = cache;
        user2 = cache;

        uint256 finalGas = gasleft();
        uint256 gasUsed = initialGas - finalGas; 

        return (initialGas, finalGas, gasUsed);
    }

    /*
	    "0": "uint256: 9132",
	    "1": "uint256: 4582",
	    "2": "uint256: 4550"
    */
}