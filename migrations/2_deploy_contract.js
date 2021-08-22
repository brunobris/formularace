const formulaRaceCarContract = artifacts.require("FormulaRaceCar.sol");
const formulaRaceContract = artifacts.require("FormulaRaceContract.sol");


module.exports = function(deployer) {
  deployer.deploy(formulaRaceCarContract).then(function(){
    return deployer.deploy(formulaRaceContract, formulaRaceCarContract.address)
  });
};

/*
module.exports = function (deployer) {
  deployer.deploy(formulaRaceCarContract);
  deployer.deploy(formulaRaceContract);
};
*/