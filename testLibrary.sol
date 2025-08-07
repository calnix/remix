
library PoolLogic {

    bytes32 public constant MONITOR_ROLE = keccak256("MONITOR_ROLE");   // only pause

}

contract Pool {
    
    function getter() public view returns (bytes32) {
        return PoolLogic.MONITOR_ROLE;
    }

}