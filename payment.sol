// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PaymentProcessing {
    address private platformOwner;
    IERC20 private thetaToken;

    event PaymentReceived(address indexed payer, uint256 amount);
    event PaymentProcessed(address indexed payer, address indexed recipient, uint256 amount);

    constructor(address _thetaToken) {
        platformOwner = msg.sender;
        thetaToken = IERC20(_thetaToken);
    }

    modifier onlyPlatformOwner() {
        require(msg.sender == platformOwner, "Only the platform owner can call this function");
        _;
    }

    function setThetaToken(address _thetaToken) public onlyPlatformOwner {
        thetaToken = IERC20(_thetaToken);
    }

    function receivePayment(uint256 _amount) public {
        thetaToken.transferFrom(msg.sender, address(this), _amount);
        emit PaymentReceived(msg.sender, _amount);
    }

    function processPayment(address _recipient, uint256 _amount) public onlyPlatformOwner {
        thetaToken.transfer(_recipient, _amount);
        emit PaymentProcessed(msg.sender, _recipient, _amount);
    }
}
