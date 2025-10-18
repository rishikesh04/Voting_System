# 🗳️ Simple Voting System (Flow EVM)

A minimal Solidity smart contract that allows users to **create proposals**, **cast votes**, and **view results** — deployed on the **Flow EVM Testnet**.  
This project demonstrates core blockchain concepts like **structs**, **mappings**, **events**, and **access control**.

---
## 🌐 Network & Deployment

| Parameter | Details |
|------------|----------|
| **Network** | Flow EVM Testnet |
| **Contract Address** | `0x037DeEB2A441A978bfb7A36417B232EbC1fC6fD1` |
| **Blockchain Explorer** | [View on FlowScan](https://evm-testnet.flowscan.io/address/0x037DeEB2A441A978bfb7A36417B232EbC1fC6fD1) |

---
## 📘 Description

This contract enables an admin (deployer) to create proposals that other users can vote on.  
Each address can vote only once per proposal.  
Once voting ends, the contract can tally and display the number of votes for each proposal.

---

## ⚙️ Features

| Feature | Description |
|----------|-------------|
| 🧾 Proposal Creation | The admin can create new proposals for voting. |
| 👥 Voting | Users can cast one vote per proposal. |
| 🔒 Access Control | Only the contract owner can add proposals. |
| 📊 Results | Anyone can view the vote count for all proposals. |
| 🧠 Concepts Covered | Structs, Mappings, Events, and Modifiers. |

---

## 🧩 Smart Contract Overview

### Contract: `VotingSystem`

#### Key Components
- **Struct:** `Proposal` → Stores proposal details and vote count.  
- **Mapping:** Keeps track of who has voted.  
- **Event:** Emits logs when proposals are created or votes are cast.  
- **Modifier:** `onlyOwner` ensures only admin can add proposals.  

#### Functions
- `createProposal(string memory _description)` → Add a new proposal.  
- `vote(uint256 _proposalId)` → Cast a vote for a proposal.  
- `getProposals()` → Returns all proposals with their vote counts.

---



## 🚀 How to Deploy (Using Remix)

1. Open [Remix IDE](https://remix.ethereum.org/).  
2. Paste the Solidity code into a new file (e.g., `VotingSystem.sol`).  
3. Compile the contract (Solidity v0.8.x).  
4. Connect to **MetaMask** using “Injected Provider”.  
5. Select **Flow EVM Testnet** network.  
6. Click **Deploy**.  
7. Interact with your deployed contract via the Remix UI.

---

## 🧠 Learning Outcomes

- Understanding of **state management** using structs and mappings.  
- How to enforce **access control** with `onlyOwner`.  
- Use of **events** for on-chain logging.  
- Hands-on experience deploying to **Flow EVM Testnet**.

---

## 📜 License

This project is licensed under the **MIT License** — free to use, modify, and distribute.

---

## 👤 Author

**Rishu**  
Deployed on **Flow EVM Testnet**  
Contract Address: `0x037DeEB2A441A978bfb7A36417B232EbC1fC6fD1`
