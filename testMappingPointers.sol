// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Test {


    // delegate data | perEpoch | perPoolPerEpoch
    struct DelegateData {
        uint128 totalVotesSpent;
        uint128 totalRewards;
        uint128 totalClaimed;
    }

    struct User {
        uint128 totalVotesSpent;
        uint128 totalRewards;
        uint128 totalClaimed;
        
        // delegation
        uint128 totalDelegated;     // for perPoolPerEpoch: states how much of user's votes were delegated to this pool; by delegate
        address delegate;           //
    }

    mapping(uint256 epoch => mapping(bytes32 poolId => mapping(address delegate => DelegateData delegateAgent))) public delegateEpochPoolData;
    mapping(uint256 epoch => mapping(bytes32 poolId => mapping(address user => DelegateData userPoolData))) public usersEpochPoolData;

    constructor(){
        usersEpochPoolData[0][0][address(0)].totalClaimed = 1;
        delegateEpochPoolData[0][0][address(0)].totalClaimed = 2;
    }

    function test(bool isDelegate) public view returns(uint256) {
        
        mapping(uint256 epoch => mapping(bytes32 poolId => mapping(address user => DelegateData userPoolData))) storage accountEpochPoolData
       = isDelegate ? (delegateEpochPoolData) : (usersEpochPoolData);

        return accountEpochPoolData[0][0][address(0)].totalClaimed;
    }

}