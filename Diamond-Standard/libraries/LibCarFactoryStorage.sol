// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "../libraries/LibDiamond.sol";

library LibCarFactoryStorage {
    bytes32 constant STORAGE_POSITION = keccak256("diamond.standard.car.factory.storage");

    struct Storage {
        address[] cars;
        mapping(uint256 => mapping(uint256 => address)) exists;
    }

    function dstorage() internal pure returns (Storage storage ds) {
        bytes32 position = STORAGE_POSITION;
        assembly {
            ds.slot := position
        }
    }
}