// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract PriceConsumerV3 {
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
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }
}