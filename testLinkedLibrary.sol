
library PoolLogic {

    function executeStake() external returns (address) {
        return msg.sender;
    }

    function executeSender1(DataTypes.Excecute1 memory ex1) external returns(uint256) {
        
        require(msg.sender != address(0));
        require(msg.sender != address(0));
        require(msg.sender != address(0));

        return (ex1.amount + 1 ether);
    }

    function executeSender2(DataTypes.Excecute2 memory ex2) external returns(uint256) {
        
        require(ex2.user != address(0));
        require(ex2.user != address(0));
        require(ex2.user != address(0));

        return (ex2.amount + 1 ether);
    }
}

contract Pool {
 
    address public user;
    address public state;

    function isSame() external view returns(bool) {
        return state == msg.sender;
    }

    function stake() external {

        state = PoolLogic.executeStake();
    } 

// ---------------------------------- passing user vs msg.sender 

    // storage
    uint256 public gasBefore_msgSender;
    uint256 public gasAfter_msgSender;

    //pointers
    uint256 public gasBefore_user;
    uint256 public gasAfter_user;

    // test use of msg.sender 
    function testSender1() external {
                
        gasBefore_msgSender = gasleft();
        
        // create struct
        DataTypes.Excecute1 memory ex1 = DataTypes.Excecute1({
            amount: 10 ether
        });
        
        //doStuff
        uint256 ret = PoolLogic.executeSender1(ex1);
        require(ret == 11 ether);

        gasAfter_msgSender = gasleft();
    }

    // test use of user var
    function testSender2() external {
                
        gasBefore_user = gasleft();
        
        // create struct
        DataTypes.Excecute2 memory ex2 = DataTypes.Excecute2({
            user: msg.sender,
            amount: 10 ether
        });
        
        //doStuff
        uint256 ret = PoolLogic.executeSender2(ex2);
        require(ret == 11 ether);

        gasAfter_user = gasleft();
    }
}


library DataTypes {

    struct Excecute1{
        //address user;
        uint256 amount;
    }

    struct Excecute2{
        address user;
        uint256 amount;
    }
}

/*
 gasBefore_msgSender = 59163
 gasAfter_msgSender =  32607
  
    26,556

 gasBefore_user = 59622
 gasAfter_user = 32678

    26,944

with 3 uses of msg.sender vs user:

 gasBefore_msgSender = 59239
 gasAfter_msgSender =  32617
  
    26,622

 gasBefore_user = 59718
 gasAfter_user = 32690

    27,028

conclusion: user msg.sender when possible. 
it costs 2 gas units vs 3 gas of mload
*/