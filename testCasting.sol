// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract RouterOnPool {

    uint public num;

    uint public num1 = 12;

    function cast() public view returns(bytes32) {
        
        //num = type(uint256).max;
        address WHITELISTED_ADDRESS = 0x228e0f99adf8bf367100BBFD9b090Bc0b15c89a9;

        return bytes32(uint256(uint160(address(WHITELISTED_ADDRESS))));
    }


    function bytes32ToAddress(bytes32 bytes32_) public pure returns(address) {
        uint256 value = uint256(bytes32_);

        // copied from OZ's SafeCast library
        if (value > type(uint160).max) {
            revert("Erroirsr");
        }
        
        return address(uint160(value));
    }


    function test() public {
        delete num1;
    }

}