// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Token {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract MyContract {
    Token public token;

    constructor(address _tokenAddress) {
        token = Token(_tokenAddress);
    }

    function transferTokens(address _recipient, uint256 _amount) public {
        require(token.transfer(_recipient, _amount), "Token transfer failed");
    }
}
