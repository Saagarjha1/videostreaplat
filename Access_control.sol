// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControl {
    address private owner;
    mapping(address => bool) private admins;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event AdminAdded(address indexed account);
    event AdminRemoved(address indexed account);

    constructor() {
        owner = msg.sender;
        admins[msg.sender] = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    modifier onlyAdmin() {
        require(admins[msg.sender], "Only admins can call this function");
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid new owner address");
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }

    function addAdmin(address _account) public onlyOwner {
        require(_account != address(0), "Invalid account address");
        require(!admins[_account], "Account is already an admin");
        admins[_account] = true;
        emit AdminAdded(_account);
    }

    function removeAdmin(address _account) public onlyOwner {
        require(_account != address(0), "Invalid account address");
        require(admins[_account], "Account is not an admin");
        admins[_account] = false;
        emit AdminRemoved(_account);
    }

    function isAdmin(address _account) public view returns (bool) {
        return admins[_account];
    }
}
