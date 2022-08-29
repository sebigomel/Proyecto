// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Traceability is Ownable {

    struct Product {
        uint256 ID;
        bytes32 ProductHash;
        address EnterpriseEA; 
    }

    mapping(address => bool) public producers;
    Product[] public products;
    uint private productCounter;

    event Action (
        uint256 ID,
        string actionType,
        address indexed executor,
        bool success
    );

    function registerProducer(address producerEA) public onlyOwner{
        producers[producerEA] = true;
    }

    function createNewProduction() external {
        products.push(Product(productCounter, "0n", msg.sender));
        productCounter++;
    }

    function uploadTraceabilityInfo(uint256 ID, bytes32 merkleTreeRoot) external {
        require(msg.sender == products[ID].EnterpriseEA, "No tienes permiso para alterar este producto");
        products[ID].ProductHash = merkleTreeRoot;
        emit Action(ID, "Upload Information", msg.sender, true);
    }
 

    }