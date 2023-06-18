// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract numone{

    uint public _val;
    address public sender;


    constructor(){

    }

    function setVar(uint _num)public {

        _val = _num;
        sender = msg.sender;

    } 
}

contract two{
    
    uint _val;
    address public sender;

    function setVar(address _add, uint _num) public {
        (bool success, bytes memory data) = _add.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );

    }
}
