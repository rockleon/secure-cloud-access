// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CloudSystem {
  // event SignatureAdded(string message, bytes32 name);

  // Store Data -->

  // Contract owner
  address public owner;

  // Structure to set interval for user
  struct Interval {
    uint from;
    uint to;
  }

  // Store user's interval mapped with user's address
  mapping (address => Interval) public User;

  // Array to store hash id's of files
  mapping (bytes32 => bool) public fileHashId;

  // Map file hash id with its cipher text
  mapping (bytes32 => bytes32) public fileCipherText;

  // Store user's secret key mapped with user's address
  mapping (address => bytes32) public userSecretKey;


  // Constructor -->
  constructor() {
    owner = msg.sender;
    uint from = block.timestamp;
    uint to = from + 10 days;
    User[msg.sender] = Interval(from, to);
  }


  // Functions -->

  // Function to check if sender is owner
  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  function setHashFileId(bytes32 hashId) public restricted returns (bool) {
    fileHashId[hashId] = true;
    return true;
  }

  function checkHashFileId(bytes32 hashId) public view returns (bool) {
    return fileHashId[hashId];
  }

  function setSecretKey(address userAddress, bytes32 key) public restricted returns (bool) {
    userSecretKey[userAddress] = key;
    return true;
  }

  function getSecretKey() public view returns (bytes32) {
    uint current_date = block.timestamp;
    if(current_date >= User[msg.sender].from && current_date <= User[msg.sender].to) {
      return userSecretKey[msg.sender];
    }
    else
      return bytes32(bytes("User Unauthorized"));
  }

  function setCipherText(bytes32 hashId, bytes32 cipherText) public restricted returns (bool) {
    if(!checkHashFileId(hashId)) return false;
    fileCipherText[hashId] = cipherText;
    return true;
  }

  function getCipherText(bytes32 hashId) public view returns (bytes32) {
    if(!checkHashFileId(hashId)) return "File Doesn't Exist!";
    return fileCipherText[hashId];
  }

  function setInterval(address userAddress, uint no_of_days) public restricted returns (bool) {
    uint from = block.timestamp;
    uint to = from + no_of_days*1 days;
    // if(from >= to) return false;
    User[userAddress] = Interval(from, to);
    return true;
  }

}