// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract RouterOnPool {

    uint public num;


    /// @dev Helper function to extract a useful revert message from a failed call.
    /// If the returned data is malformed or not correctly abi encoded then this call can fail itself.
    function getRevertMsg(bytes memory returnData) internal pure returns (string memory)
    {
        // If the _res length is less than 68, then the transaction failed silently (without a revert message)
        if (returnData.length < 68) return "Transaction reverted silently";

        assembly {
            // Slice the sighash.
            returnData := add(returnData, 0x04)
        }

        return abi.decode(returnData, (string)); // All that remains is the revert string
    }

    /// @dev Allows batched call to self (this contract).
    /// @param calls An array of inputs for each call.
    function batch(bytes[] memory calls) public payable returns(bytes[] memory results) {

        results = new bytes[](calls.length);

        for (uint256 i; i < calls.length; i++) {

            (bool success, bytes memory result) = address(this).delegatecall(calls[i]);

            if (!success) revert(getRevertMsg(result));

            results[i] = result;
        }

    }


    function test(uint _num) public {

        bytes memory payload = abi.encodeWithSignature("setVars(uint256)", _num);
        
        (bool success, bytes memory result) = address(this).delegatecall(payload);

        if (!success) revert(getRevertMsg(result));
    }



    function setVars(uint _num) external payable {
        num = _num;
    }

    
}



contract TestRevert {

    uint256 public num;

    function batch() external payable returns (bytes[] memory results) {

        bytes memory payload_1 = abi.encodeWithSignature("setVars(uint256)", 1);
        bytes memory payload_2 = abi.encodeWithSignature("rever()");
        
        bytes[] memory calls = new bytes[](2);
        calls[0] = payload_1;
        calls[1] = payload_2;

        results = new bytes[](2);
        
        for (uint256 i; i < 2; i++) {

            (bool success, bytes memory result) = address(this).delegatecall(calls[i]);
            if (!success) revert("fail");
            results[i] = result;
        }
    }

    function setVars(uint _num) external  {
        num = _num;
    }

    function rever() public {
        
        uint arr;
        arr = 1 +2;

       //revert();
    }


}