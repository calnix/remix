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
}