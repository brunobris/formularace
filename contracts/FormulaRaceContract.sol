pragma solidity >= 0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./FormulaRaceCar.sol";

contract FormulaRaceContract is Ownable {

    uint16 public _ethanolMaxAmount = 1000;
    uint16 public _mechanicMaxAmount = 10;
    mapping (address => uint256) _ethanolPerAddress;
    mapping (address => uint8) _mechanicsPerAddress;

    FormulaRaceCar public formulaRaceCar;

    constructor(FormulaRaceCar _formulaRaceCar) {
        formulaRaceCar = _formulaRaceCar;
    }

    function getOwnedCars() public view returns(uint256[] memory) {
        uint256[] memory tokens = new uint256[](formulaRaceCar.balanceOf(msg.sender));
        for(uint256 i = 0; i < tokens.length; i++) {
            tokens[i] = formulaRaceCar.tokenOfOwnerByIndex(msg.sender, i);
        }
        return tokens;
    }

    function buyEthanol(uint16 _amount) public {
        //TODO: How to charge using PODIUM?
        require(_ethanolPerAddress[msg.sender] + _amount <= _ethanolMaxAmount, 'Cant own more than 1000 ethanol');
        _ethanolPerAddress[msg.sender] += _amount;
    }

    function getEthanolByAccount(address account) public view returns (uint256){
        return _ethanolPerAddress[account];
    }

    function buyMechanic() public {
        //TODO: How to charge using PODIUM?
        //Each meachanic will cost 10% more than the last one
        require(_mechanicsPerAddress[msg.sender] < _mechanicMaxAmount, 'Cant own more than 10 mechanics.');
        _mechanicsPerAddress[msg.sender]++;
    }   

    function getMechanicsByAccount(address account) public view returns (uint8){
        return _mechanicsPerAddress[account];
    }

    function _isCarOwner(uint tokenId) internal view {
        require(formulaRaceCar.ownerOf(tokenId) == msg.sender, "Not the car owner.");
    }

    modifier carOwnerOnly(uint tokenId) {
        _isCarOwner(tokenId);
        _;
    }

    function joinDailyRace(uint tokenId) public carOwnerOnly(tokenId) {
        require(tokenId <= formulaRaceCar.getLastTokenId(), 'Token with given id does not exist');
        
        //TODO: Race logic here
        formulaRaceCar.updateLastRaceTime(tokenId);
    }

/*
    function joinGrandPrixRace(uint256 tokenId) public carOwnerOnly(tokenId) {
        require(tokenId < nextId, 'Token with given id does not exist');
        //Race logic here
        _tokenDetails[tokenId].lastRace = block.timestamp;
    }
    */
    
}