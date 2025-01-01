// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Router {

    uint public num;
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

        bytes memory payload = abi.encodeWithSignature("setVars(uint256)", _num);
        
        (bool success, bytes memory result) = address(this).delegatecall(payload);
        if (!success) revert(getRevertMsg(result));
    }

    // check if msg.sender changes
    function test2WBatch(uint _num) public {

        bytes memory payload = abi.encodeWithSignature("setVars(uint256)", _num);
        
        bytes[] memory allCalls = new bytes[](2);

        allCalls[0] = payload;
        allCalls[1] = payload;

        batch(allCalls);
    }


    function setVars(uint _num) external payable {
        pool.setVars(_num);
    }

    function setPool(address pool_) public {
        pool = Pool(pool_);
    }
}


contract Pool {

    uint public num;
    address public caller;

    function setVars(uint _num) public payable {
        num = _num;
        caller = msg.sender;
    }

}

// ---------------------------------------------------------------------------------------------
// Test msg.sender

contract RouterSender {

    PoolReceiver public receiver;

    //1. set PoolReceiver addr
    function setPool(address receiver_) public {
        receiver = PoolReceiver(receiver_);
    }

    function callExt() public {
        receiver.setVars(msg.sender);
    }

}

contract PoolReceiver {

    address public onBehalfOf;
    address public myAddr;

    constructor(){
        myAddr = address(this);
    }

    function setVars(address onBehalfOf_) public payable {
        onBehalfOf = onBehalfOf_;
    }

    function retbytes32() public view returns(bytes32){
        return bytes32(uint256(uint160(address(0))));

    }

}