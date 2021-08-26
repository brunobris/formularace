pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract FormulaRaceDriver is ERC721, Ownable {
    constructor() ERC721("FormulaRace Driver", "FRD") {
    }

    struct Driver {
        uint8 nationality; // 0=ARG, 1=BRA, 2=CAN, 3=CHL, 4=CHN, 5=COL, 6=FRA, 7=DEU, 8=IND, 9=IDN, 10=ITA, 11=JPN, 12=MEX, 13=PHL, 14=USA, 15=VEN
        uint16 exp; // max 
    }
}