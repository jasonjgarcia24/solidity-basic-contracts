pragma solidity ^0.5.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/math/SafeMath.sol";


contract MYTokenSafe {
    using SafeMath for uint;
    
    string public symbol = "MYTKN";
    uint exchange_rate = 100;
    address payable owner = msg.sender;
    
    mapping(address => uint) balances;
    
    function balance() public view returns(uint) {
        return balances[msg.sender];
    }
    
    function transfer_token(address recipient, uint value) public {
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[recipient].add(value);
    }
    
    function purchase() public payable {
        uint amount = msg.value * exchange_rate;
        balances[msg.sender].sub(amount);
        owner.transfer(msg.value);
    }
    
    function mint(address recipient, uint value) public {
        require(recipient == owner, "You are not authorized!");
        balances[recipient] = balances[owner].add(value);
    }
}