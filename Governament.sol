// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract Governament{
    struct Transection{
        address frome; 
        address to; 
        uint amount;
        uint txId;
    }
    Transection [] transectionLog;

    function addTransection(address _frome, address _to, uint _amount)external {
        Transection memory _transection= Transection(_frome,_to,_amount,transectionLog.length);
        transectionLog.push(_transection);
    }
    function getBalance(uint index) public  view  returns(address,address,uint){
        return (transectionLog[index].frome,transectionLog[index].to,transectionLog[index].amount);
    }
}