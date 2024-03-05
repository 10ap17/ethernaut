// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);
    //first call of _buyer.price() has to return higher or equal price
    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      //second call of _buyer.price() has to return lower price, to pass the challenge
      price = _buyer.price();
    }
  }
}