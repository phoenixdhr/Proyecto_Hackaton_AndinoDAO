// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <=0.9.0;

//import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Router {
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts){}
}

contract swapPancake
{
  Router router = Router(0xD99D1c33F9fC3444f8101754aBC46c52416550D1);
  ERC20 WBNB_token = ERC20(0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd);
  ERC20 BUSD_token = ERC20(0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7);

  function swapBNBoBSDC() external payable
  {
    
    address[] memory path = new address[](2);
    path[0] = address(WBNB_token);
    path[1] = address(BUSD_token);

    //DAI_token.approve(address(router), amount);

    router.swapExactETHForTokens{value: msg.value}(0,path, msg.sender, block.timestamp);
 } 
}