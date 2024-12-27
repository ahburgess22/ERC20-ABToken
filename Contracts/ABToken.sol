// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ABToken is ERC20, Ownable {
    mapping(address => uint256) public stakedBalances; // Stores users' staked balances
    address public immutable feeRecipient = 0x1234567890123456789012345678901234567890; // Fee recipient acts as an external wallet (bank, corporation, staking pool, etc.)
    struct Config {
        uint256 rewardRate; // Reward percentage for staking
        uint256 feePercentage; // Transaction fee percentage
    }
    Config public config = Config(50, 20); // Reward rate: 50%, Fee: 20%

    constructor() ERC20("ABToken", "ABT") Ownable(msg.sender) {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    // Mint new tokens
    function mint(address to, uint256 value) external onlyOwner {
        require(value > 0, "ABT: Mint value must be greater than zero.");
        
        _mint(to, value);
    }

    // Burn tokens
    function burn(address from, uint256 value) external onlyOwner {
        require(balanceOf(from) >= value && value > 0, "ABT: Account balance is insufficient or attempted to burn zero tokens.");

        _burn(from, value > balanceOf(from) ? balanceOf(from) : value); // Gracefully handle over-burning
    }

    // Transfer with a fee (think banks, Venmo, etc.)
    function transfer(address to, uint value) public virtual override returns (bool) {
        require(value > 0 && balanceOf(msg.sender) >= value, "ABT: Insufficient balance or attempted to transfer zero tokens.");

        uint fee = (value * config.feePercentage) / 100;
        uint valueAfterFee = value - fee;
        _transfer(msg.sender, feeRecipient, fee); // Send fee to recipient
        _transfer(msg.sender, to, valueAfterFee); // Send remaining value
        return true;
    }

    // Stake tokens
    function stake(uint value) external onlyOwner {
        require(balanceOf(msg.sender) >= value && value > 0, "ABT: Insufficient balance or attempted to stake zero tokens.");

        uint256 existingStake = stakedBalances[msg.sender];
        stakedBalances[msg.sender] = existingStake + value;
        _transfer(msg.sender, feeRecipient, value);
    }

    // Unstake tokens
    function unstake() external onlyOwner {
        uint256 existingStake = stakedBalances[msg.sender];
        require(existingStake > 0, "ABT: No tokens staked.");

        uint reward = (existingStake * config.rewardRate) / 100;
        _transfer(feeRecipient, msg.sender, existingStake); // Return staked tokens
        _mint(msg.sender, reward); // Mint staking reward
        stakedBalances[msg.sender] = 0; // Reset staked balance
    }
}
