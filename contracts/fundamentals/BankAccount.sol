pragma solidity ^0.5.0;


contract BankAccount {
    address payable accountOwner = 0xe67b33D7C5ff1Db9Bb12e5672c49Db3eEB87f3c6;
    
    /* This function allows us to "withdraw" ETH form this "BankAccount" contract.
     *  The address payable type is the same as the address type, however it
     *  includes additional members (i.e., functions) "transfer" and "send".
     *  The idea behind this distinction is that address payable is an address
     *  you can send Ether to, while a plain address cannot be sent Ether.
     */
    function withdraw(uint _amount, address payable _recipient) public {
        if (_recipient == accountOwner) {
            return _recipient.transfer(_amount);
        }
    }
    
    function deposit() public payable {}
    
    /* This function is known as a "fallback function". A fallback function returns
     * in two scenarios: if the function identifier doesn't match any other function
     * in the contract or if the sending function supplied no data.
     */
    function() external payable {}
    
}