const formulaRaceContract = artifacts.require("FormulaRaceContract.sol");
const formulaRaceCarContract = artifacts.require("FormulaRaceCar.sol");
const podiumContract = artifacts.require("Podium.sol");

//TODO: Why the interface?
//const IERC20 = artifacts.require("IERC20");




module.exports = async function(deployer) {
  let carContract = await deployer.deploy(formulaRaceCarContract);
  let podium = await deployer.deploy(podiumContract);

  let game = await deployer.deploy(formulaRaceContract, podiumContract.address, formulaRaceCarContract.address)
  
};

/*
module.exports = function (deployer) {
  deployer.deploy(formulaRaceCarContract);
  deployer.deploy(formulaRaceContract);
};
*/