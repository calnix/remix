// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Test {

    struct RoundData {
        uint128 startTime;
        uint128 allocation;
        uint128 deposited;
        uint128 claimed;
    }


    function strDeposit(uint256[] calldata rounds) external {

        uint256 roundsLength = rounds.length;

        for(uint256 i = 0; i < roundsLength; ++i) {
            
            // get round no. & round data
            uint256 round = rounds[i];
            RoundData storage roundData = allRounds[round];

            // check that round has been setup
            if (roundData.allocation == 0) revert RoundNotSetup();

            // check that round was not previously financed
            if (roundData.deposited == roundData.allocation) revert RoundAlreadyFinanced();

            // update deposit and increment
            roundData.deposited = roundData.allocation;
            totalAmount += roundData.allocation;
        }
    }


}