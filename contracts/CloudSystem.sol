// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CloudSystem {
  // event SignatureAdded(string message, bytes32 name);

  // Store Data -->

  // Contract owner
  address public owner = msg.sender;

  // Structure to set interval for user
  struct Interval {
    uint256 from;
    uint256 to;
  }

  // Store user's interval mapped with user's address
  mapping (address => Interval) public User;

  // Array to store hash id's of files
  mapping (bytes32 => bool) public fileHashId;

  // Map file hash id with its cipher text
  mapping (bytes32 => bytes32) public fileCipherText;

  // Store user's secret key mapped with user's address
  mapping (address => bytes32) public userSecretKey;



  // Functions -->

  // Function to check if sender is owner
  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  function setHashFieldId(bytes32 hashId) public restricted returns (bool) {
    fileHashId[hashId] = true;
    return true;
  }

  function checkHashFieldId(bytes32 hashId) public view returns (bool) {
    return fileHashId[hashId];
  }

  function setSecretKey(address userAddress, bytes32 key) public restricted returns (bool) {
    userSecretKey[userAddress] = key;
    return true;
  }

  function getSecretKey() public view returns (bytes32) {
    return userSecretKey[msg.sender];
  }

  function setCipherText(bytes32 hashId, bytes32 cipherText) public restricted returns (bool) {
    if(!checkHashFieldId(hashId)) return false;
    fileCipherText[hashId] = cipherText;
    return true;
  }

  function getCipherText(bytes32 hashId) public view returns (bytes32) {
    if(!checkHashFieldId(hashId)) return "false";
    return fileCipherText[hashId];
  }

  function setInterval(address userAddress, uint from, uint to) public restricted returns (bool) {
    if(from >= to) return false;
    User[userAddress] = Interval(from, to);
    return true;
  }

  function getInterval() public view returns (uint256[2] memory) {
    return [User[msg.sender].from, User[msg.sender].to];
  }


  // function signBook(bytes32 name) public {
  //   guests.push(name);
  //   emit SignatureAdded("New guest signature!", name);
  // }
  // function getNames() public view returns (bytes32[] memory) {
  //   return guests;
  // }
}