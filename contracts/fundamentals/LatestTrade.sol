pragma solidity ^0.5.0;


contract LatestTrade {
    string coin = "BTC";
    uint price;
    bool isBuyOrder;
    
    function updateTrade(string memory _newCoin, uint _newPrice, bool _isBuy) public {
        coin = _newCoin;
        price = _newPrice;
        isBuyOrder = _isBuy;
    }
    
    function getLatestTrade() view public returns(string memory, uint, bool) {
        return (coin, price, isBuyOrder);
    }
    
    function setTransferInfo(address _sender, address _receiver, uint _amount) public {
        // set user data here
    }
    
}