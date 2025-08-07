contract testarrrays {



    function _removeFromArray(uint256[] memory originalArr, uint256[] memory arrToRemove) external  pure returns (uint256[] memory) {
        uint256 originalLength = originalArr.length;
        uint256 toRemoveLength = arrToRemove.length;
        
        uint256[] memory resArr = new uint256[](originalLength - toRemoveLength);
        uint256 k;

        for(uint256 i; i < originalLength; ++i){
            bool shouldKeep = true;
            
            // Check if current element should be removed
            for(uint256 j; j < toRemoveLength; ++j){
                if(originalArr[i] == arrToRemove[j]){
                    shouldKeep = false;
                    break;
                } 
            }

            if(shouldKeep) {
                resArr[k] = originalArr[i];
                ++k;
            }            
        }

        return resArr;
    }

    function dupArrayCheck1(uint256[] memory tokenIds) public pure returns (uint256[] memory) {
        uint256 incomingNfts = tokenIds.length;

        if (incomingNfts > 1) {
            for (uint256 i; i < incomingNfts - 1; ++i) {
                for (uint256 j = i + 1; j < incomingNfts; ++j) {

                    if(tokenIds[i] == tokenIds[j]) revert();
                }
            }
        }
    }

    function dupArrayCheck2(uint256[] memory tokenIds) public pure returns (uint256[] memory) {
        uint256 incomingNfts = tokenIds.length;

        if(incomingNfts > 1) {
            for(uint256 i; i < incomingNfts; ++i) {
                for(uint256 j; j < incomingNfts; ++j) {
                   
                    if(i == j) continue; // comparing same ele
                   
                    if(tokenIds[i] == tokenIds[j]) revert();
                }
            }
        }
    }
}