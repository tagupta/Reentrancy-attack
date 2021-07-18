//"SPDX-License-Identifier:UNLICENSED
pragma solidity 0.7.5;

contract FundRaiser{
    mapping(address => uint)balances;
    
    function deposit()external payable returns(uint){
        balances[msg.sender] += msg.value;
        return balances[msg.sender];
    }
    
  /**
    * This function is protected against reentrant attack, as it's following the CHECK-EFFECT-INTERACTION pattern
    */
    function withdraw()external{
        uint amountToWithdraw = balances[msg.sender];
        require(amountToWithdraw > 0, 'Insufficient funds to withdraw'); //check
        balances[msg.sender] = 0;    //effects
        (bool success,) = msg.sender.call{value: amountToWithdraw}(""); //interaction
        require(success,"Withdrawal falied");
    }
    
    function getTotalFunds() public view returns(uint){
        return address(this).balance;
    }
    
    function myBalance() public view returns(uint){
        return balances[msg.sender];
    }
}
