// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract TestIntPub {

    uint256 public endTime_public; 
    uint256 internal endTime_internal; 

    mapping (uint256 user => uint256 number) public pubMapping;
    mapping (uint256 user => uint256 number) internal privMapping;

    // state vars 
    uint256 public gas_publicVar_before;
    uint256 public gas_publicVar_after;

    // 
    uint256 public gas_privateVar_before;
    uint256 public gas_privateVar_after;

    //mappings
    //uint256 public gas_pubMapping_before;
    //uint256 public gas_pubMapping_after;
    
    //uint256 public gas_privMapping_before;
    //uint256 public gas_privMapping_after;


    constructor(){
        

        pubMapping[uint256(0)] = privMapping[uint256(0)] = uint256(12);
    }


    function setEndTimePublic() external {
        gas_publicVar_before = gasleft();

        uint256 cache = endTime_public;

        cache++;

        endTime_public = cache + 12;

        gas_publicVar_after = gasleft();
    }

/*
gas_before = 79872
gas_after = 35314
diff = 44,558
*/


    function setEndTimePrivate() external {
        gas_privateVar_before = gasleft();

        uint256 cache = endTime_internal;

        cache++;

        endTime_internal = cache + 12;

        gas_privateVar_after = gasleft();
    }

/*
gas_before = 79874
gas_after = 35315
diff = 44,227
*/
    struct Test{
        uint256 one;
    }

    function ret() public pure returns(Test memory) {
        Test memory test;
        test.one = 1;

        test = incre(test);

        return test;
    }

    function incre(Test memory test) public pure returns (Test memory) {
        
        test.one++;

        return test;
    }
}