// SPDX-License-Identifier: GPL-3.0

// This contract is a contract for Native tokens(Eth, BNB, AVAX...)

pragma solidity >=0.7.0 <0.9.0;

contract Staking {

    uint T = 0;
    uint S = 0;
    
    mapping(address => uint) stake;
    mapping(address => uint) s;

    uint decimals = 8;

    constructor() {}

    function Deposite() external payable{
        stake[msg.sender] = msg.value;
        s[msg.sender] = S;
        T += msg.value;
    }

    function Withdraw() external {
        require(stake[msg.sender] > 0, "You have to value.");
        uint deposited = stake[msg.sender];
        uint reward = deposited * (S - s[msg.sender]) / 10 ** decimals;
        T = T - deposited;
        stake[msg.sender] = 0;

        payable(msg.sender).transfer(deposited + reward);
    }

    function Distribute() external payable {
        require(T > 0, "No Deposite");
        S = S + msg.value * 10 ** decimals / T;
    }
}