contract testarrrays {

        function _concatArrays(uint256[] memory arr1, uint256[] memory arr2) public view returns(uint256[] memory) {
        
        // create resulting arr
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;

        uint256[] memory resArr = new uint256[](length1 + length2);
        
        uint256 i;
        for (; i < length1; i++) {
            resArr[i] = arr1[i];
        }
        
        uint256 j;
        while (j < length2) {
            resArr[i++] = arr2[j++];
        }

        return resArr;
    }
}