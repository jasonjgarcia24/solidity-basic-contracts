pragma solidity ^0.5.0;

import "./XP_TokenMintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract XP_TokenSale is Crowdsale, MintedCrowdsale {
    
    constructor (
        uint rate,
        address payable wallet,
        XP_Token token
    ) Crowdsale(rate, wallet, token) public {
        
    }
}

contract XP_TokenSaleDeployer {
    address public xp_sale_address;
    address public token_address;
    
    constructor (
        string memory xname,
        string memory symbol,
        address payable wallet
    ) public {
        XP_Token token = new XP_Token(xname, symbol, 0);
        token_address = address(token);
        
        XP_TokenSale xp_sale = new XP_TokenSale(1, wallet, token);
        xp_sale_address = address(xp_sale);
        
        token.addMinter(xp_sale_address);
        token.renounceMinter();
    }
}