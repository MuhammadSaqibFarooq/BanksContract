// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.2 <0.9.0;
 contract ownable{
   address public owner;
 constructor() {

        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }
 }