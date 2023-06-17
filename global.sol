// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract globalcon{

    address public owner;
    uint public gasStart = gasleft();
    mapping (address => uint) public member;

    constructor(){

        owner = msg.sender;
    }

    function amount() public payable {
        require(msg.value > 1 ether, "The amount should be greater than 1 eth");
        member[msg.sender] += msg.value;

    }

    function checkGas() public view returns(uint) {
       
        return gasStart - gasleft();

    }
}
