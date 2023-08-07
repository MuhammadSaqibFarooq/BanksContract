// SPDX-License-Identifier: GPL-3.0
import "./Ownable.sol";

pragma solidity >=0.7.2 <0.9.0;

contract Destroy is ownable {
     function destroy() public onlyOwner {
         address payable receiver = payable(msg.sender);
         selfdestruct (receiver);
     }
}
