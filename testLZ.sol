// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract LZTest {

    uint256 public ret;
    
    uint40 public endTime;
       
    function send(bytes calldata /*_oftCmd*/ ) external returns(uint) {
        
        ret = 1+1;
        
        return ret;
    }


    function getChainId(uint id) external pure returns(uint16){
        return uint16(id);
    }

    function getPath(address remote, address local) external pure returns(bytes memory){
        bytes memory path = abi.encodePacked(remote, local);
        return path;

    }

    enum VaultDuration{
        NONE,       //0
        THIRTY,     //1
        SIXTY,      //2 
        NINETY      //3
    }

    function test3(VaultDuration duration)public view returns(uint256) {
        uint256 res = 1 * uint8(duration);

        return res;
    }

    function testEndTime() public {
        endTime = uint40(block.timestamp) + uint40(120 days);
    }

    function time() public pure returns(uint256) {
        uint256 ret = 7 + 30 days;

        return ret;
    }


    function testincrement() public pure returns(uint256) {
        uint256 test = 12;

        --test;

        return test;
    }
    
    uint16 internal constant OPTION_TYPE_3 = 3;
    error InvalidOptions(bytes options);

}


contract creditLower {

    function _credit(uint256 _amountLD, uint32 /*_srcEid*/) public virtual returns (uint256 amountReceivedLD) {
        // @dev Default OFT mints on dst.
        // @dev In the case of NON-default OFT, the _amountLD MIGHT not be == amountReceivedLD.
        return _amountLD;
    }
}


contract creditHigher is creditLower {
    
    function _credit(uint256 _amountLD, uint32 _srcEid) public override returns (uint256) {
        uint256 _amountLD = super._credit(_amountLD, _srcEid);
        return _amountLD;

    }
}
