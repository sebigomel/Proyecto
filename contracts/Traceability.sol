// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Traceability is Ownable {

    mapping(address => bool) public producers;

    function registerProducer(address producerEA) public onlyOwner{
        producers[producerEA] = true;
    }

    

    }