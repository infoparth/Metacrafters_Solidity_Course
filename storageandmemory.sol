// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract sandm{

    uint public number;  //storage variable
    address public add; //storage variable

    constructor(){}

    function checkRand(uint num) public pure returns(bool){

        uint test = 5; //memory variable

        return (num % test == 0);

    }
}
