pragma solidity ^0.5.0;


contract BankAccount {
    address owner = 0xe67b33D7C5ff1Db9Bb12e5672c49Db3eEB87f3c6;
    bool isNewAccount;
    uint public accountBalance;
    string customerFirstName;
    string customerLastName;
    
    function getInfo() view public returns(address, bool, uint, string memory, string memory) {
        return (owner, isNewAccount, accountBalance, customerFirstName, customerLastName);
    }
    
    function setInfo(
        bool _isNewAccount,
        string memory _customerFirstName,
        string memory _customerLastName
    ) public {
        isNewAccount = _isNewAccount;
        customerFirstName = _customerFirstName;
        customerLastName = _customerLastName;
    }
    
    function sendRemittance(uint _amount, address payable _recipient) public {
        _recipient.transfer(_amount);
        accountBalance = address(this).balance;
    }
    
    function deposit() public payable {
        accountBalance = address(this).balance;
        
    }
    
    // Basic fallback function
    function() external payable {}
    
}