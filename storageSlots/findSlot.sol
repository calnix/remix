contract ECDSADistributor {

    function testReturn() public view returns(bytes32) {

        bytes32 location = 0x13649b2456f1b42fef0f0040b3aaeabcd21a76a0f3f5defd4f583839455116e8;

        uint256 add = 20;
        bytes32 memory x = 0x20;
        bytes32 increment = bytes32(add);

        return increment;

    }

}