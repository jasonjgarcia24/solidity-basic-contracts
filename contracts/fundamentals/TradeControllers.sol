pragma solidity ^0.5.0;


contract TradeController {
    uint previousPrice;
    string tradeType;
    
    function makeTrade(uint _currentPrice) public {
        bool _buyAnyway;
        
        if (_currentPrice < previousPrice || _buyAnyway) {
            tradeType = "Buy";
        }
        else if (_currentPrice < previousPrice) {
            tradeType = "Sell";
        }
        else {
            tradeType = "Hold";
        }
    }
}