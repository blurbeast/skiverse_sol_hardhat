// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {SkiverseObjects} from "./SkiverseObjects.sol";

library SkiverseLibrary {
    struct SkiverseStorage {
        mapping(uint256 => address) crayonPlayerIdToSmartAccountAddress;
        address[] owners;
        address gameTokenAddress;
        SkiverseObjects.LeadersBoard[] leadersBoard;
    }

    function registerCrayonPlayer(SkiverseStorage storage s, uint256 id, address smartAccount) internal {
        require(id > 0, "id must be greater than zero");
        address foundAccount = s.crayonPlayerIdToSmartAccountAddress[id];
        require(foundAccount == address(0), "id has been assigned to another player");

        s.crayonPlayerIdToSmartAccountAddress[id] = smartAccount;
        // emit here
    }

    function setLeadersBoard(SkiverseStorage storage s, SkiverseObjects.LeadersBoard[] memory board) internal {
        delete s.leadersBoard;
        uint256 newBoardLength = board.length;
        for (uint256 i = 0; i < newBoardLength; i++) {
            s.leadersBoard.push(board[i]);
        }
        // emit here
    }
}
