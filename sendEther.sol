// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract etherToWei{

     receive() external payable {}

     

    function convertToWei() public view  returns (uint256) {
        return address(this).balance;
    }
    
     function convertToEther() public  view returns (uint256) {
         uint amountInWei  = address(this).balance;
        uint amountInEther = amountInWei / (1e18);
        return amountInEther;
    }

    
    function convertToGwei() public view   returns (uint256) {
        uint amountInWei  = address(this).balance;
        uint256 amountInGwei = amountInWei / (1e9);
        return amountInGwei;
    }


}
