// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SharedStorage.sol";

// Upgradable proxy
contract Proxy is SharedStorage {
    /**
    * @dev UpgradeableProxy is a proxy contract to a contract implementation. The implementation
    *      can update the reference, which effectively upgrades the contract
    * @param _contractImpl Address of the contract used as implementation
    */
    constructor(address _contractImpl) public {
        contractImplementation = _contractImpl;
    }
    
    /**
    * @dev Performs a delegatecall and returns whatever the delegatecall returned (entire context execution will return!)
    */
    fallback() external payable {
        address implementation = contractImplementation;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())

            let result := delegatecall(gas(), implementation, ptr, calldatasize(), 0, 0)

            let size := returndatasize()
            returndatacopy(ptr, 0, size)

            switch result
                case 0 {revert(ptr, size)}
                default {return (ptr, size)}
        }
    }

    receive() external payable {}
}
