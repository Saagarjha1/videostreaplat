// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VideoToken is ERC20 {
    address private platformOwner;

    event TokensMinted(address indexed recipient, uint256 amount);

    constructor(string memory _name, string memory _symbol, address _platformOwner) ERC20(_name, _symbol) {
        platformOwner = _platformOwner;
    }

    modifier onlyPlatformOwner() {
        require(msg.sender == platformOwner, "Only the platform owner can call this function");
        _;
    }

    function mintTokens(address _recipient, uint256 _amount) public onlyPlatformOwner {
        _mint(_recipient, _amount);
        emit TokensMinted(_recipient, _amount);
    }
}
