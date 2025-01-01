// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract GasCosts {

    struct Stream {
        // slot0
        uint128 claimed;
        uint128 lastClaimedTimestamp;
        // slot 1
        bool isPaused;
    }

    mapping(uint256 tokenId => Stream stream) public streams;
    
   
    // memory 
    uint256 public gas_memory_before;
    uint256 public gas_memory_after;

    // storage
    uint256 public gas_storage_before;
    uint256 public gas_storage_after;

    //pointers
    uint256 public gas_storagePointers_before;
    uint256 public gas_storagePointers_after;

    function testMemory() public {
        
        gas_memory_before = gasleft();

        
        //cache
        Stream memory stream = streams[1];

        //doStuff
        stream.claimed += 10 ether;
        stream.lastClaimedTimestamp = uint128(block.timestamp);
        
        //update storage
        streams[1] = stream;


        gas_memory_after = gasleft();
    }

    function testStorage() public {
        
        gas_storage_before = gasleft();

        
        //doStuff
        streams[1].claimed += 10 ether;
        streams[1].lastClaimedTimestamp = uint128(block.timestamp);
  

        gas_storage_after = gasleft();
    }

    
    function testPointers() public {
        
        gas_storagePointers_before = gasleft();

        // pointer
        Stream storage stream = streams[1];
        
        //doStuff
        stream.claimed += 10 ether;
        stream.lastClaimedTimestamp = uint128(block.timestamp);
  

        gas_storagePointers_after = gasleft();
    }

}
