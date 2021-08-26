const FormulaRaceContratct = artifacts.require('FormulaRaceContract');

contract('FormulaRaceContract', async accounts => {
    it('Should deploy FormulaRaceContract', async() => {
        const frcgame = await FormulaRaceContratct.deployed();
        assert(frcgame.address != '');
    });

    it('Should buy ethanol', async () => {
        const frcgame = await FormulaRaceContratct.deployed();
        await frcgame.buyEthanol(100);
        assert(await frcgame.getEthanolBalance(accounts[0]) == 100);
    });
    
    it('Should hire a mechanic and charge in ethanol', async () => {
        const frcgame = await FormulaRaceContratct.deployed();
        const mechanicPrice = await frcgame.getMechanicPriceInEthanol();
        const ethanolBalanceBefore  = await frcgame.getEthanolBalance(accounts[0]);

        await frcgame.hireMechanic(); //first will cost 0
        await frcgame.hireMechanic(); //second will cost 50

        const mechanicsBought = await frcgame.getMechanicsByAccount(accounts[0]);
        const ethanolBalance = await frcgame.getEthanolBalance(accounts[0]);

        assert.equal(2, mechanicsBought);
        assert.equal(ethanolBalanceBefore - mechanicPrice, ethanolBalance);
    });

    it('Should return Car with ID 2', async () => {
       
    });

    it('Should not allow more than maximum allowed mechanics', async () => {
       
    });

    it('Should not allow buyimg more than the maximum allowed ethanol', async () => {
       
    });

    it('Should not allow to join a race with a car address does not own', async () => {
       
    });
    
    //TODO: Test with error/validation messages
});