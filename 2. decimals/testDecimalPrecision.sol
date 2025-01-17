// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract PrecisionConversion {

    uint public upper;
    uint public lower;

    function cast() public {
        
        uint256 base  = 11111;
        uint256 based = 77777;
        
        lower = base / 1E2;
        upper = based / 1E2;
    }

    function sec1() public view returns(uint256) {
        
        uint256 inputTokens = 1.2345678 ether;
        uint256 TOKEN_PRECISION = 1e6;

        uint256 stakedMocaRebased = (inputTokens * TOKEN_PRECISION) / 1E18;
        
        return stakedMocaRebased;
    }

    
    function sec2() public view returns(uint256) {
        
        uint256 inputTokens = 1.2345678 ether;
        uint256 TOKEN_PRECISION = 1e21;

        uint256 stakedMocaRebased = (inputTokens * TOKEN_PRECISION) / 1E18;
        
        return stakedMocaRebased;
    }
    
    function sec3() public view returns(uint256) {
        
        uint256 inputTokens = 1.2345678 ether;
        uint256 TOKEN_PRECISION = 1e1;

        uint256 stakedMocaRebased = (inputTokens * TOKEN_PRECISION) / 1E18;
        
        return stakedMocaRebased;
    }

    function sec4() public view returns(uint256) {
        
        uint256 inputTokens = 1.2345678 ether;
        uint256 TOKEN_PRECISION = 1e0;

        uint256 stakedMocaRebased = (inputTokens * TOKEN_PRECISION) / 1E18;
        
        return stakedMocaRebased;   // 1
    }

    function sec5() public view returns(uint256) {
        
        uint256 inputTokens = 1.2345678 ether;
        uint256 TOKEN_PRECISION = 0;

        uint256 stakedMocaRebased = (inputTokens * TOKEN_PRECISION) / 1E18;
        
        return stakedMocaRebased;   // 0
    }

    function indexPrecision() public pure returns(uint256) {
        
        uint256 totalBalance = 1.23 ether;
        uint256 distribution_TOKEN_PRECISION = 1e1;
        
        // totalBalanceRebased = 12
        uint256 totalBalanceRebased = (totalBalance * distribution_TOKEN_PRECISION) / 1E18;

        //return totalBalanceRebased;

        //note: indexes are denominated in the distribution's precision
        //assume first update
        uint256 distribution_index = 0;
        
        // assume emissionPerSecond is 1 reward token
        uint256 emittedRewards = (1 * distribution_TOKEN_PRECISION) * 1; // distribution.emissionPerSecond * timeDelta: 
        //return emittedRewards;  // emittedRewards = 10

        uint256 nextDistributionIndex = ((emittedRewards * distribution_TOKEN_PRECISION) / totalBalanceRebased) + distribution_index; 
        return nextDistributionIndex;   // 8 = ((10 * 10) / 12) + 0
    }  



/*
    nextDistributionIndex = 8 reward tokens per unit MOCA staked

    check if correct:
    - mocaStaked: 1.23 ether
    - emittedRewards = 1 reward token in 1e1 precision [10]
    
    - mocaStakedRebased: (1.23e18 * 1e1)/1e18 = 12
    - rewardsPerMocaStakedRebased: (emittedRewards * rewardPrecision) / mocaStakedRebased = (10 * 1e1) / 12 = 8 
    
    0.8 reward tokens are given out per stakedMoca. [since 1 unit is 1e1]
    0.8 * 1.23 = 0.984 reward tokens are emitted in TOTAL 
    slightly lesser than the 1 reward token that was meant to be emitted 
     
*/

    function indexPrecision2() public pure returns(uint256) {
        
        uint256 totalBalance = 1.23 ether;
        uint256 distribution_TOKEN_PRECISION = 1e21;
        
        // totalBalanceRebased = 1230000000000000000000 = 1.23e21
        uint256 totalBalanceRebased = (totalBalance * distribution_TOKEN_PRECISION) / 1E18;
        //return totalBalanceRebased;

        //note: indexes are denominated in the distribution's precision
        //assume first update
        uint256 distribution_index = 0;
        
        // assume emissionPerSecond is 1 reward token
        uint256 emittedRewards = (1 * distribution_TOKEN_PRECISION) * 1; // distribution.emissionPerSecond * timeDelta: 
        //return emittedRewards;  // emittedRewards = 1000000000000000000000 = 1e21

        uint256 nextDistributionIndex = ((emittedRewards * distribution_TOKEN_PRECISION) / totalBalanceRebased) + distribution_index; 
        return nextDistributionIndex;   // 813008130081300813008 = ((1e21 * 1e21) / 1.23e21) + 0 = 0.813008130081300813008
    }  


    function nftPrecision() public pure returns(uint256) {
        
        uint256 PRECISION_BASE = 10_000;
        
        uint256 amount = 1 ether;
        uint256 vault_totalBoostFactor = 20_050* 1;  // assume 1 nft staked

        uint256 incomingBoostedStakedTokens = (amount * vault_totalBoostFactor) / PRECISION_BASE;

        return incomingBoostedStakedTokens;
        // 1 ether: 2005000000000000000 = 2.005 tokens
        // 1.23 ether: 2466150000000000000 = 2.46615 tokens -> 200.5%
    }
}



