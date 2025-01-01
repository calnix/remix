// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Test {

    function _authorizeUpgrade(uint256) public {}


    modifier onlyOwner() {
        require(msg.sender == address(0), "fuck you");
        _;
    }

    function time() public view returns(uint256) {
        
        return block.timestamp;
    }
}