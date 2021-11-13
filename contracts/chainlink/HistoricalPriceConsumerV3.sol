// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract HistoricalPriceConsumerV3 {
    address public dataFeedAddress = 0x9326BFA02ADD2366b30bacB125260Af641031331;
    AggregatorV3Interface internal priceFeed;
    
    /*
     * Network: Kovan
     * Aggregator: ETH/USD
     * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
     *
     * Aggregator: VXX/USD
     * Address: 0xC18F2a0C166A091fcD5E2051EFEFD63c4f4A27E9
     */
    constructor() {
        priceFeed = AggregatorV3Interface(dataFeedAddress);
    }
    
    /*
     * Returns historical price for a round id.
     * roundId is NOT incremental. Not all roundIds are valid.
     * You must know a valid roundId before consuming historical data.
     *
     * ROUNDID VALUES:
     *    InValid:      18446744073709562300
     *    Valid:        18446744073709562301
     *
     * @dev A timestamp with zero value means the round is not complete
     * and should not be used.
     */
    function getHistoricalPrice(uint80 _roundId) public view returns (uint80, int, uint, uint, uint80) {
        (
            uint80 _id,
            int _price,
            uint _startedAt,
            uint _timeStamp,
            uint80 _answeredInRound
        ) = priceFeed.getRoundData(_roundId);
        
        require(_timeStamp > 0, "Round not complete");
        
        return (_id, _price, _startedAt, _timeStamp, _answeredInRound);
    }
}