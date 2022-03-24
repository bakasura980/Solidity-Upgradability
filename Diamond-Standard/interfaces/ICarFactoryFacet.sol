// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICarFactoryFacet {
    function createCar(uint256 engineNumber, uint256 model, address car) external;
}
