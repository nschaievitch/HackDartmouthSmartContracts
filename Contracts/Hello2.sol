// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MyContract {
	string private message = "Hello, World!";
	
	function setMessage (string memory _message) public {
		message = _message;
	}
	
	function helloWorld() public view returns (string memory) {
		return message;
	}
}