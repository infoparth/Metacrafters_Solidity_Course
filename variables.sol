// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract variables{

    uint public alpha;

    uint public beta;

    address public owner;

    bytes32 public name;

    bool public test;

    constructor(address _owner){

        owner = _owner;


    }

    function setAlphaBeta(uint _alpha, uint _beta) public {

        alpha = _alpha;

        beta = _beta;

    }

    function setOwner(address _new) public {

        require(msg.sender == owner,  "Only the Owner can access this function");
        owner = _new;

    }

    function setName(bytes32 _name) public {

        name = _name;
    }

    function testValue(bool _test)public {

        test = _test;

    }

    function getAlphaBeta() public view returns(uint, uint){

        return (alpha, beta);

    } 

    function getSum() public view returns(uint){

        uint d = alpha + beta;

        return d;

    }

    function getOwner() public view returns(address){

        return owner;

    }

    function getTestValue() public view returns(bool){

        return test;

    }

}
