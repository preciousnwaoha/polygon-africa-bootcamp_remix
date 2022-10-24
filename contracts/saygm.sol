// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SayGM is Ownable {
    string public prompt = "Say GM";

    struct Answer {
        address from;
        string answer;
    }

    Answer[] answers;

    uint256 public tips;

    // emit an event whenever someone answers
    event NewAnswer(address indexed from, string answer);

    constructor() {}

    function setPrompt(string memory newPrompt) public onlyOwner {
        prompt = newPrompt;
        delete answers;
    }

    function answer(string memory input) public {
        // create answer struct and push into answer array
        answers.push(Answer(msg.sender, input));
        emit NewAnswer(msg.sender, input);
    }

    function getAnswers() public view returns (Answer[] memory) {
        return answers;
    }

    function getPrompt() public view returns (string memory) {
        return prompt;
    }

    function tip() public payable {
        tips += msg.value;
    }

    function withdraw() public payable onlyOwner {
        payable(msg.sender).transfer(address(this).balance); // security issues, so keep in mind
    }
}
