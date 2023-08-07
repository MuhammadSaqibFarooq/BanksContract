// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.2 <0.9.0;

import "./Ownable.sol";
import "./Destroyable.sol";

interface governamentInterface {
    function addTransection(address _frome, address _to, uint _amount)external ;
    
}

contract Bank  is ownable,Destroy{

   governamentInterface GovernamentInstance = governamentInterface(0x9bF88fAe8CF8BaB76041c1db6467E7b37b977dD7);
    mapping(address => uint256) private balances;
  

    event Deposit(address indexed account, uint256 amount);
    event Withdrawal(address indexed account, uint256 amount);

   

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    function contractBalance()public  view returns(uint){
        return  address(this).balance;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

     function transfer(address  payable recipient, uint256 amount) public {

         require(balances[msg.sender] >= amount, "Insufficient balance");
         require(msg.sender!=recipient,"do not sendt balance to your Self"); 
        //   uint previousSenderBalance=  balances[msg.sender];
         recipient.transfer(amount);
         GovernamentInstance.addTransection(msg.sender, recipient,amount);
    balances[msg.sender] -= amount;
      balances[recipient] += amount;
       
     }
}
