// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SayGM is Ownable {
    string public prompt = "Say GM";

    struct Answer {
        address from;
        string answer;
    }

    Answer[] public answers;

    uint256 public tips;

    

}
