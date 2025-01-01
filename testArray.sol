contract Array {

    // Several ways to initialize an array
    uint256[] public dynArr; 
    
    // will fail is dynArr has not been assigned any elements.
    // also, not needed, since dynArr is public.
    function get(uint i) public view returns (uint) {
        return dynArr[i];
    }

    // Append to array: increases length by 1.
    function push() public {
        dynArr.push(11);
        dynArr.push(12);
        dynArr.push(13);
    }
    
    // Remove last element from array: decreases length by 1
    function pop() public {
        dynArr.pop();
    }

    function getLength() public view returns (uint) {
        return dynArr.length;
    }

    // Delete does not change the array length.
    // It resets the value at index to it's default value,
    function remove(uint index) public {
        delete dynArr[index];
    }
}