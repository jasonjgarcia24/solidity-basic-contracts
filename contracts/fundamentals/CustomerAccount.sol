pragma solidity ^0.5.0;


contract CustomerAccount {
    address owner = 0xC63a5869c653843f16247149FAE4fab9B65988B1;
    bool isNewAccount;
    uint64 accountBalance;
    string customerFirstName;
    string customerLastName;
    
    function getInfo() view public returns(bool, uint64, string memory, string memory) {
        return (
            getIsNewAccount(),
            getAccountBalance(),
            getCustomerFirstName(),
            getCustomerLastName()
        );
    }
    
    function setInfo(
        bool _isNewAccount,
        uint64 _accountBalance,
        string memory _customerFirstName,
        string memory _customerLastName
    ) public {
        setIsNewAccount(_isNewAccount);
        setAccountBalance(_accountBalance);
        setCustomerFirstName(_customerFirstName);
        setCustomerLastName(_customerLastName);
    }
    
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
    
    function setIsNewAccount(bool _isNewAccount) internal {
        isNewAccount = _isNewAccount;
    }
    
    function setAccountBalance(uint64 _accountBalance) internal {
        accountBalance = _accountBalance;
    }
    
    function setCustomerFirstName(string memory _customerFirstName) internal {
        customerFirstName = _customerFirstName;
    }
    
    function setCustomerLastName(string memory _customerLastName) internal {
        customerLastName = _customerLastName;
    }    
}