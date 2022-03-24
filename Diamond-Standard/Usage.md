```
    const diamondAddress = await Diamond.deploy()

    // Create cars
    const carFactory = ICarFactory(diamondAddress)
    await carFactory.createCar(...)
    
    // Add / Remove / Update functionalities
    const upgradableContract = IDiamondCut(diamondAddress)
    await upgradableContract.diamondCut(...)
```