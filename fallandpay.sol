// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract fall_pay{

    address payable public owner;

    mapping (address => uint ) track;
    
    constructor()
    {

        owner = payable(msg.sender);
    }

    function pay() external payable{

    track[msg.sender] += msg.value;
}

function get_bal() external view returns(uint){

    return address(this).balance;

}

function check_contri(address _add) external view returns(uint) {

    if (track[_add] > 0){

        return track[_add];

    }

    else return 0;
}

fallback() external payable{

    track[msg.sender] += msg.value;

}

receive() external payable {
    track[msg.sender] += msg.value;
  }
}