// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.22;

contract Router {

    Pool public pool;


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

        bytes memory payload = abi.encodeWithSignature("setVars(uint256,address)", _num, msg.sender);
        
        bytes[] memory allCalls = new bytes[](1);
        allCalls[0] = payload;

        batch(allCalls);
    }


    function setVars(uint _num, address onBehalfOf) external payable {
        pool.setVars(_num, onBehalfOf);
    }

    function setPool(address pool_) public {
        pool = Pool(pool_);
    }
}


contract Pool {

    uint256 public num;
    address public msgSender;

    function setVars(uint256 _num, address onBehalfOf) public {
        num = _num;
        msgSender = onBehalfOf;
    }
}