// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract RouterOnPool {

    uint public num;

    function cast() public view returns(bytes32) {
        
        //num = type(uint256).max;
        address WHITELISTED_ADDRESS = 0x228e0f99adf8bf367100BBFD9b090Bc0b15c89a9;

        return bytes32(uint256(uint160(address(WHITELISTED_ADDRESS))));
    }

}