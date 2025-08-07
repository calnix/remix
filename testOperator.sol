// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

contract Test {


    address public sumAddr = address(1);

    function ret(uint256 decrement) public pure returns(bytes32) {
        uint256 blockNum = 100;
        uint256 blockTimestamp = 86476;
        address user2 = address(0x537C8f3d3E18dF5517a58B3fB9D9143697996802);

        uint256 salt = blockNum - decrement;
        bytes32 vaultId = bytes32(keccak256(abi.encode(user2, blockTimestamp, salt)));

        return vaultId;
    }

    function _generateVaultId(uint256 salt, address user) internal view returns (bytes32) {
        return bytes32(keccak256(abi.encode(user, block.timestamp, salt)));
    }

    function check() public pure returns(uint256){
        bytes32 id = 0x24f6c86cc299508a85c4c0de7b08ff7d3fba2a939acdfe2307e0465e9e417506;

        uint256 i;
        while (ret(i) != id) {
            ++i;
        }
        return i;
    }

    function sugarcheck() public pure returns(uint256) {
        uint256 i = 100;

        return --i;
    }

}


/**
    block.number - 0 = 0xf308e6d432407bf9ea889b73008c6ae99ebb03d1b2dcdcdf0103b6eb9062ae2f
    block.numer - 1  = 0x77ef858ae41d213576e5bec5c381bed9f75215d8c7f26b8901541cc46279785f
    block.numer - 2  = 0x6ac0d48a6d4835e690203549b92b0e881216b63c82a5d3007bf923f61159667a
    block.numer - 3  = 0x6b8b2bb019add4134f3bdac2ea5338a24facd8256f90ceae5c0f0b2c6ec1115a
    block.numer - 4  = 0x8940b0fcc0d27ff29f13c8b067f56db4b1bd3c039c2b370aa93cd35faa2f2bd8
    block.numer - 5  = 0xb57c15f8f5f6515507f1dcfa37f2096a38e329a7eb8ec6182b3eb417114a0460
*/