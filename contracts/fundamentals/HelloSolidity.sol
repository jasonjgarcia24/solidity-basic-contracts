pragma solidity ^0.5.0;


contract HelloSolidity {
    string public message;
    
    constructor(string memory _message) public {
        message = _message;
    }
    
    function updateMessage(string memory _message) public {
        message = _message;
    }
}