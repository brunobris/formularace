pragma solidity >= 0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract FormulaRaceCar is ERC721Enumerable, Ownable {
    constructor() ERC721("FormulaRace Car", "FRC") {
    }

    struct Car {
        uint16 topSpeed;
        uint8 acceleration;//21 for 2.1 sec, 22 for 2.2 sec
        uint16 weight;
        uint256 lastRace;
    }

    uint256 nextId = 0;
    mapping (uint256 => Car) _tokenDetails;

    function mint() public onlyOwner {
        //TODO: Use Chainlink random for random attributes
        //https://docs.chain.link/docs/get-a-random-number/
        _tokenDetails[nextId] = Car(350, 21, 730, block.timestamp);
        _safeMint(msg.sender, nextId);
        nextId++;
    }

    function getCar(uint256 tokenId) public view returns (Car memory) {
        return _tokenDetails[tokenId];
    }

    function getLastTokenId() public view returns (uint256) {
        return nextId -1;
    }

    function updateLastRaceTime(uint256 tokenId) public {
        _tokenDetails[tokenId].lastRace = block.timestamp;
    }

}