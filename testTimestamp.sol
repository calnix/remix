// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Timestmap {

    uint public lastReceivedTimestamp = 0;
    uint public currTimestamp = 86411;


    uint public _lastReceivedTimestamp;
    uint public _currTimestamp;

    function checktime() public returns (bool) {    
            _currTimestamp  = currTimestamp / (1 days);                 // 84611/86400 -> set to 0
            _lastReceivedTimestamp = lastReceivedTimestamp / (1 days);  // set to 0

        if ((currTimestamp / (1 days)) > (lastReceivedTimestamp / (1 days))) {
        
            return true;
        }
    }

    function ret() public pure returns(uint256) {
        uint256 curr = 86411;
        uint256 last = 86400;
        return uint256(curr / last);    // returns 1 
    }

    function ret1() public pure returns(uint256) {
        return 1 days;
    }
}



contract Caller {

    function ret() public view returns(bytes32) {
        
        bytes32 vaultId;
        {
           // vaultId generation
            uint256 salt = block.number - 1;
            vaultId = _generateVaultId(salt);
        }
        return vaultId;
    }

    
    function _generateVaultId(uint256 salt) internal view returns (bytes32) {
        return bytes32(keccak256(abi.encode(msg.sender, block.timestamp, salt)));
    }
}




contract DivisonPeriod {

    function test() external view returns(uint256){
        uint256 period = endTime - startTime; 
        emissionPerSecond = allocationPerNft_ / period;
    }
}
