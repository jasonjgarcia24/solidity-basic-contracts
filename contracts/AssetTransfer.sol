pragma solidity ^0.5.0;


contract PersonalSavings {
  uint public balance = address(this).balance;
  event fundMoved(address _recipient, uint _amount);


  function withdraw(uint _amount, address payable _recipient) public {
    require(balance > _amount, "Insufficient funds.");
    emit fundMoved(_recipient, _amount);
    
    balance = address(this).balance - _amount;

    _recipient.transfer(_amount);
  }

  function deposit() public payable {
    balance = address(this).balance;
  }

}
