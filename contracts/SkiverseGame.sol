// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {SkiverseLibrary} from "./libraries/SkiverseLibrary.sol";
import {SkiverseObjects} from "./libraries/SkiverseObjects.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SkiverseGame {
    using SkiverseLibrary for SkiverseLibrary.SkiverseStorage;
    SkiverseLibrary.SkiverseStorage private crayonStorage;

        constructor(address _gameToken){
            crayonStorage.gameTokenAddress = _gameToken;
        }

    function registerPlayer(uint256 id, address smartAccount) external {
        // confirm the id is not yet registered
        SkiverseLibrary.registerCrayonPlayer(crayonStorage, id, smartAccount);
        // to emit
    }

    function setLeadersBoard(SkiverseObjects.LeadersBoard[] memory board) external {
        SkiverseLibrary.setLeadersBoard(crayonStorage, board);
    }

    function getLeadersBoard() external view returns (SkiverseObjects.LeadersBoard[] memory) {
        //        CrayonObjects.LeadersBoard?
        uint256 boardLength = crayonStorage.leadersBoard.length;
        SkiverseObjects.LeadersBoard[] memory leadersBoard = new SkiverseObjects.LeadersBoard[](boardLength);
        for (uint256 i = 0; i < boardLength; i++) {
            leadersBoard[i] = crayonStorage.leadersBoard[i];
        }
        return leadersBoard;
    }

    function getPlayer(uint256 id) external view returns (SkiverseObjects.Player memory) {
        address _account = crayonStorage.crayonPlayerIdToSmartAccountAddress[id];
        return SkiverseObjects.Player({
            id: id,
            player: _account,
            playerCrayonTokenBalance: IERC20(crayonStorage.gameTokenAddress).balanceOf(_account)
        });
    }
}
