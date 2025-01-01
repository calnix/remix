// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Encoding {

    function testEncode() public view returns(address, uint256[] memory){

        uint256[] memory tokenIds = new uint256[](2);

        tokenIds[0] = 1;
        tokenIds[1] = 2;

        bytes memory payload = abi.encode(msg.sender, tokenIds);

        (address owner, uint256[] memory output) = abi.decode(payload, (address, uint256[]));

        return (owner, output);

    }
}


