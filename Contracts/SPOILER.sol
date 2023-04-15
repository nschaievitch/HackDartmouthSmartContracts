// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This is a sample solution for the BioManager. Don't open until you tried to make it yourself!

contract BioManager {
    mapping(address => string) private bios;
    
    function setBio(string memory newBio) public {
        bios[msg.sender] = newBio;
    }

    function getBio(address add) public view returns (string memory) {
        string memory bio = bios[add];
        if (bytes(bio).length == 0) {
            return "(no bio)";
        } else {
            return bio;
        }
    }

}
