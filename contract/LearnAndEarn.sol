// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LearnAndEarn {
    // Mapping to track token balances for each user
    mapping(address => uint256) public balances;

    // Event emitted when tokens are earned
    event TokensEarned(address indexed user, uint256 amount);
    
    // Event emitted when tokens are spent
    event TokensSpent(address indexed user, uint256 amount, string resource);

    // Function to allow a user to earn tokens
    function earnTokens() public {
        uint256 amount = 10; // Each call to this function earns the user 10 tokens
        balances[msg.sender] += amount;
        emit TokensEarned(msg.sender, amount);
    }

    // Function to allow a user to spend tokens on a resource
    function spendTokens(uint256 amount, string memory resource) public {
        require(balances[msg.sender] >= amount, "Not enough tokens"); // Check if user has enough tokens
        balances[msg.sender] -= amount; // Deduct the tokens from the user's balance
        emit TokensSpent(msg.sender, amount, resource);
    }

    // Function to check the balance of the user who calls this function
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
