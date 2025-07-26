// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

library SkiverseObjects {
    struct LeadersBoard {
        bytes username;
        uint256 score;
    }

    struct Player {
        uint256 id;
        address player;
        uint256 playerCrayonTokenBalance;
    }
}
