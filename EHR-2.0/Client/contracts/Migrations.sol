// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
// this contract is a basic implementation that allows the 
//contract's owner to set the value of last_completed_migration using the 
//setCompleted function. It provides a mechanism to track the completion of 
//migrations in a decentralized application (DApp) or smart contract system.
contract Migrations {
  address public owner = msg.sender;
  uint public last_completed_migration;

  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
}
