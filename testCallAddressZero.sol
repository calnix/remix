// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

interface IRewardsVault {

    function srcEid() external;
    function increment() external;

}


contract Pool {

    IRewardsVault public REWARDS_VAULT;
    uint256 public sym;

    constructor(){
        address sumAddr = address(0);
        REWARDS_VAULT = IRewardsVault(sumAddr);
    }

    function test() public {
        sym = 1;

       REWARDS_VAULT.srcEid();
    }


}