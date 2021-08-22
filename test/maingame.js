const FormulaRaceContratct = artifacts.require('FormulaRaceContract');

contract('FormulaRaceContract', () => {
    it('Should deploy FormulaRaceContract', async() => {
        const frcgame = await FormulaRaceContratct.deployed();
        console.log(frcgame.address);
        assert(frcgame.address != '');
    });
});