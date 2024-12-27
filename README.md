# ABToken (ABT)
ABT is a custom implementation of the ERC-20 token standard, built for educational and demonstrational purposes. It extends the standard ERC-20 functionality with additional features like transaction fees, staking, and rewards. While the **deployed contract is designed for testing**, this respository reflects a production-like implementation showcasing how such a token could operate in real-world scenarios.
## Deployed Contract
- **Deployed Address:** 0x643433B42b1f1C4cd806c34A613004EC68e828c7
- **Network:** Sepolia Testnet
## Features
1. **ERC-20 Standad Compliance**
   - Implements _OpenZeppelin's ERC-20 standard_ to ensure compatibility with wallets and exchanges.
2. **Custom Functionality**
   - **Minting:** Allows the owner to mint new tokens.
   - **Burning:** Allows the owner to burn tokens from specific addressses.
   - **Transaction Fees:** Deducts a configurable percentage of each transaction as a fee and send it to a designated recipient (e.g., a corporation or staking pool).
3. **Staking and Rewards**
   - **Stake:** Users can stake tokens to the contract, reflecting real-world holding incentive scenarios.
   - **Unstake:** Users can withdraw staked tokens with additional rewards based on a reward rate.
4. **Ownership Control**
   - Includes the _Ownable_ module to restrict sensitive operations to the contract owner.
## Implementation Highlights
#### Transaction Fees
- A fee percentage (default: 3%) is deducted from every transfer and sent to the feeRecipient. In this version, the feeRecipient is a placeholder address simulating a corporation or bank.
#### Staking and Rewards
- Users can stake tokens to the contract.
- Upon unstaking, users receive their original tokens plus rewards calculated as a percentage of the staked amount.
- Rewards are minted to the user at the time of unstaking.
#### Customization
- The feeRecipient and rewardRate can be updated to reflect real-world scenarios, such as partnering with a financial institution or setting dynamic reward rates.
## Repository Details
This repository contains the Solidity source code for ABToken, demonstrating real-world token logic. The deployed contract on Sepolia is slightly different and intended for educational purposes:
#### GitHub Version
- Reflects production-like logic where the feeRecipient and staking recipient are external addresses (e.g., a corporation or bank).
#### Deployed Version
- Uses address(this) for both feeRecipient and staking recipient, making the contract itself act as the recipient.
## Usage Instructions
#### Deploying the Contract
1. Clone this repository
2. Install dependencies (if applicable).
3. Deploy the contract using Remix, Hardhat, or Truffle.
#### Interacting with the Contract
- Use Remix or any Ethereum wallet (e.g., MetaMask) to interact with the deployed contract.
- Test functionality such as minting, burning, staking, and transferring.
#### Educational Notes
This project demonstrates the following:
- Extending the ERC-20 token standard.
- Implementing advanced token features like fees and staking.
- Configuring a contract for testing and production scenarios.

The deployed contract serves as a working example of these features in a controlled testnet environment.
## License
This project is licensed under the MIT License. See the LICENSE file for details.
## Contact
For questions or feedback, please feel free to reach out via email: ahburgess22@gmail.com
