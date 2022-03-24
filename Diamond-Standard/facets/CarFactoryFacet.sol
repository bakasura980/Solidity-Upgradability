// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../libraries/LibDiamond.sol";
import "../libraries/LibCarFactoryStorage.sol";

import "../interfaces/ICarFactoryFacet.sol";

contract CarFactoryFacet is ICarFactoryFacet {

    event CarCreated(uint256 engineNumber, uint256 model, address car);

    function createCar(uint256 engineNumber, uint256 model, address car) external returns (address car) {
        LibDiamond.enforceIsContractOwner();
        LibCarFactoryStorage.Storage storage ds = LibCarFactoryStorage.dstorage();

        require(ds.exists[engineNumber][model] != address(0), "CarFactory: CAR_ALREADY_EXISTS");
        ds.cars.push(car);
        ds.exists[engineNumber][model] = car; 

        emit CarCreated(engineNumber, model, car);
    }
}
