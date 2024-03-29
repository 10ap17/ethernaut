// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
  //in each slot it can be stored 32 bytes
  //slot 0
  bool public locked;// 1 byte
  //slot 1
  bytes32 private password;//32 bytes

  constructor(bytes32 _password) {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}