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
   - **Staking and Rewards**
      - **Stake:** Users can stake tokens to the contract, reflecting real-world holding incentive scenarios.
      - **Unstake:** Users can withdraw staked tokens with additional rewards based on a reward rate.
   - **Ownership Control:** Includes the _OpenZeppelin Ownable_ module to restrict sensitive operations to the contract owner.
3. **Customization**
   - **FeeRecipient and RewardRate:** The **_feeRecipient_** address is a placeholder representing a corporation, bank or  staking pool. The **_rewardRate_** can be configured for custom staking rewards.
   - This GitHub version uses a placeholder address (**_0x123456789..._**) to represent the fee recipient. The ployed contract on Sepolia uses **_address(this)_** as the recipient for educational purposes
## Implementation Highlights
#### Transaction Fees
- A fee percentage (default: 3%) is deducted from every transfer and sent to the _feeRecipient_. The _feeRecipient_ is set to _address(this)_ in the deployed contract but is configurable for production use.
#### Staking and Rewards
- Users can stake tokens to the contract.
- Upon unstaking, users receive their original tokens plus rewards calculated as a percentage of the staked amount.
- Rewards are minted to the user at the time of unstaking.
#### Educational Notes
- The deployed contract demonstrates concepts like staking and fee deduction but is not production-ready. The GitHub version includes improvements for simulating real-world scenarios, such as external fee recipients.
## Repository Details
#### GitHub Version
- Reflects production-like logic where the _feeRecipient_ and staking recipient are external addresses (e.g., a corporation or bank).
#### Deployed Version
- Uses _address(this)_ for both _feeRecipient_ and staking recipient, making the contract itself act the recipient for demonstration purposes.
## Usage Instructions
#### Deploying the Contract
1. Clone this repository
2. Install dependencies (if applicable).
3. Deploy the contract using Remix, Hardhat, or Truffle.
#### Interacting with the Contract
1. **Without redeploying:**
   - In Remix, select "Injected Provider - MetaMask" in the environment dropdown.
   - Click "At Address" and paste the deployed contract address: **_0x643433B42b1f1C4cd806c34A613004EC68e828c7_**.
   - Access all functions like _mint_, _burn_, _transfer_, _stake_, and _unstake_.
2. **With MetaMask:**
   - Add ABT to MetaMask using the deployed address.
   - Test functions like minting, transferring, and staking directly.
## Professional Notes
This project demonstrates the following:
- Extending the ERC-20 token standard.
- Implementing advanced token features like fees and staking.
- Configuring a contract for testing and production scenarios.

The deployed contract serves as a working example of these features in a controlled testnet environment.
## License
This project is licensed under the MIT License. See the LICENSE file for details.
## Contact
For questions or feedback, please feel free to reach out via email: ahburgess22@gmail.com
