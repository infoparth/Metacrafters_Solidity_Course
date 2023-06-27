// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

interface abs{

    function test1(address _Add) external view returns(uint);

}

contract test2{

    function test() public virtual view  {

    }
}

contract finaltest is abs, test2{

    uint a =10;
    uint b = 5;
    


    function test() public override view{

       uint  c = a+b;
    }

    function test1(address _add) public view returns (uint){

        return a;


    }
}
