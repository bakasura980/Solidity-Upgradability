// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SharedStorage.sol";

contract Implementation is SharedStorage {

    event UpgradedContract(address newImpl);
    function upgradeImplementation(address newImpl) public {
        contractImplementation = newImpl;
        emit UpgradedContract(newImpl);
    }

    event SetNumber(uint256 newNumber);
    uint256 public number;

    function setNumber(uint256 newNumber) external {
        number = newNumber;
        emit SetNumber(newNumber);
    }
    
}
