// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Caller {

    function sCall(address module) external view {
        
        bytes memory data = abi.encodeWithSignature("isOwnerOf(uint256)", 1);
        (bool success, bytes memory result) = module.staticcall(data);

        require(success);
    }
}


contract Callee {

    error Invalid();

    function isOwnerOf(uint256 tokenId) external pure {
        
        uint256 id = tokenId;

        revert Invalid();
    }

}