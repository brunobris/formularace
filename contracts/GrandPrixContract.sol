pragma solidity >= 0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract GrandPrixContract is Ownable {

    struct GrandPrixData {
        uint256 startsAt;
        uint256 endsAt;
        uint8 ethanolCost; //rewards will be calculated according to ethanol cost
        uint16[] ranking; //0 - 1st, 1- 2nd, 2 - 3th // Needs winner address
    }

    GrandPrixData[] grandPrixEvents;

    function addGrandPrixEvent(uint256 startsAt, uint256 endsAt, uint8 ethanolCost) public onlyOwner {
        //TODO: Do some validations
        grandPrixEvents.push(GrandPrixData(startsAt, endsAt, ethanolCost, new uint16[](0)));
    }

    function getLastGrandPrix() public view returns (GrandPrixData memory) {
        uint256 lastGrandPrixId = grandPrixEvents.length - 1;
        return grandPrixEvents[lastGrandPrixId];
    }
}