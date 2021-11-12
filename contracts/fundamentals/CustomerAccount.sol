pragma solidity ^0.5.0;


contract CustomerAccount {
    address owner = 0xC63a5869c653843f16247149FAE4fab9B65988B1;
    bool isNewAccount;
    uint64 accountBalance;
    string customerFirstName;
    string customerLastName;
    
    function getIsNewAccount() view internal returns(bool) {
        return isNewAccount;
    }
    
    function getAccountBalance() view public returns(uint64) {
        return accountBalance;
    }
    
    function getCustomerFirstName() view public returns(string memory) {
        return customerFirstName;
    }
    
    function getCustomerLastName() view public returns(string memory) {
        return customerLastName;
    }
    
    function setIsNewAccount(bool _isNewAccount) internal returns(bool) {
        isNewAccount = _isNewAccount;
    }
    
    function setAccountBalance(uint64 _accountBalance) internal returns(uint64) {
        accountBalance = _accountBalance;
    }
    
    function setCustomerFirstName(string memory _customerFirstName) internal returns(string memory) {
        customerFirstName = _customerFirstName;
    }
    
    function setCustomerLastName(string memory _customerLastName) internal returns(string memory) {
        customerLastName = _customerLastName;
    }    
}