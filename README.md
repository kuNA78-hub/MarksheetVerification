# 🎓 Blockchain-Based Marksheet Verification System

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg) ![Solidity](https://img.shields.io/badge/Solidity-^0.8.0-lightgrey.svg) ![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

A simple yet robust Solidity smart contract that allows educational institutions to **issue and verify student marksheets** on the blockchain. This system ensures **authenticity**, **transparency**, and creates a **tamper-proof** academic record.



## 🧠 Overview

Traditional paper-based marksheets are susceptible to forgery, damage, and loss. This project leverages the **Ethereum blockchain** to create a secure, decentralized, and immutable ledger for academic records.

* 🏫 **Admin (Institute):** The designated owner of the contract (the institution) is the only one who can add and verify new marksheets.
* 👩‍🎓 **Students & Employers:** Anyone can publicly verify the authenticity of a marksheet using a student's unique roll number.
* 🔒 **Immutable & Transparent:** Once a marksheet is added to the blockchain, it cannot be altered or deleted, providing a permanent and trustworthy source of truth.

---

## ⚙️ Tech Stack

This project uses a standard, lightweight stack for smart contract development and deployment:

| Component | Technology Used | Description |
| :--- | :--- | :--- |
| **Smart Contract** | `Solidity (v0.8.x)` | The core logic for storing and verifying marksheets. |
| **Blockchain** | `Ethereum (Sepolia Testnet)` | The decentralized network where the contract is deployed. |
| **Development** | `Remix IDE` | Browser-based IDE for easy compilation and deployment. |
| **Interaction** | `MetaMask` | Crypto wallet for managing the admin account and paying gas fees. |
| **Frontend Libs**| `ethers.js` / `web3.js` | (Not implemented) Libraries to build a web interface. |

---

## 🚀 How It Works: The Flow

The system operates on a simple, secure three-step process:

1.  **Deploy:** The educational institution (Admin) deploys the `MarksheetVerification.sol` contract to the Ethereum network. The deploying wallet address becomes the `owner`.
2.  **Issue:** For each student, the Admin calls the `addMarksheet()` function, passing in the student's details. This transaction is signed by the Admin, and the marksheet data is stored securely in the contract's mapping.
3.  **Verify:** A student, employer, or any third party can instantly verify a marksheet by calling the `verifyMarksheet()` function with the student's `rollNumber`. This is a read-only operation (a "call") and costs no gas. It returns the student's details if the record exists and is verified.

---

## 📁 Smart Contract Breakdown

The `MarksheetVerification.sol` contract is designed for simplicity and security.

### Key Components

* **`struct Marksheet`**
    A custom data structure to hold all the information for a single academic record. The `isVerified` flag is crucial for confirming a record's existence.

    ```solidity
    struct Marksheet {
        string studentName;
        uint256 rollNumber;
        string courseName;
        uint8 marks;
        bool isVerified; // Use this to check if a record exists
    }
    ```

* **`mapping(uint256 => Marksheet) public marksheets;`**
    The "database" of the contract. It maps a unique `rollNumber` (key) to its corresponding `Marksheet` struct (value).

* **`modifier onlyOwner()`**
    A security check that restricts certain functions (like `addMarksheet`) so they can only be called by the `owner` (the institute) of the contract.

### Core Functions

* **`addMarksheet(...)` (Admin Only)**
    This function allows the `owner` to add a new marksheet. It first checks that a marksheet for that `_rollNumber` doesn't already exist, then creates and stores the new `Marksheet` struct. It also `emit`s an event for off-chain tracking.

* **`verifyMarksheet(...)` (Public)**
    This is a `public view` (read-only) function, meaning anyone can call it for free. It retrieves the `Marksheet` for a given `_rollNumber`. The `require(m.isVerified, ...)` check ensures that it only returns data for records that have been explicitly added, preventing "false" or empty results.

---

## 🏁 Getting Started & Deployment

You can easily compile and deploy this contract using **Remix IDE**.

### Prerequisites
* [MetaMask](https://metamask.io/) browser extension.
* Sepolia test ETH (Get from a [faucet](https://sepoliafaucet.com/)).

### Deployment Steps

1.  **Open Remix:** Go to [remix.ethereum.org](https://remix.ethereum.org/).
2.  **Create File:** Create a new file named `MarksheetVerification.sol` and paste the provided [contract code](#-smart-contract-code) into it.
3.  **Compile:**
    * Go to the "Solidity Compiler" tab (second icon on the left).
    * Select a compiler version compatible with `^0.8.0` (e.g., `0.8.19`).
    * Click "Compile MarksheetVerification.sol".
4.  **Deploy:**
    * Go to the "Deploy & Run Transactions" tab (third icon).
    * Under "Environment," select **"Injected Provider - MetaMask"**. (Make sure MetaMask is connected to the Sepolia Testnet).
    * Click the "Deploy" button.
    * Confirm the transaction in your MetaMask wallet.
5.  **Done!** Your contract is now live on the Sepolia testnet. You can find its address in the "Deployed Contracts" section of Remix.

---

## Interact with the Deployed Contract

This contract is already **live and verified** on the Sepolia Testnet.

* **Contract Address:** `0x223feCD20263f08A9F96E5030b0D8db0317c4c8b`
* **Verified Source (Sourcify):** [Click to view contract](https://repo.sourcify.dev/11142220/0x223feCD20263f08A9F96E5030b0D8db0317c4c8b/)

You can interact with it directly using Remix or Etherscan.
<img width="1919" height="1019" alt="image" src="https://github.com/user-attachments/assets/2ebd5733-156e-4255-8574-4c6d5eb51b32" />
### Example: How to Verify a Marksheet
1.  Go to the [Sourcify link](https://repo.sourcify.dev/11142220/0x223feCD20263f08A9F96E5030b0D8db0317c4c8b/) and connect your wallet.
2.  Find the `verifyMarksheet` function.
3.  Enter a `_rollNumber` (e.g., `101`) and click "Query".
4.  You will instantly see the student's data if it exists.

---

## 💡 Future Improvements

This is a foundational project. Here are some ways it could be expanded:

* **Build a Frontend:** Create a React.js or Vue.js DApp with `ethers.js` to provide a user-friendly interface for the institute and verifiers.
* **IPFS Integration:** Instead of storing all data on-chain (which can be expensive), store a **hash (fingerprint)** of the marksheet (PDF/JSON) on-chain and store the file itself on [IPFS](https://ipfs.tech/).
* **Batch Issuing:** Add a function to allow the admin to add multiple marksheets in a single transaction to save on gas fees.
* **Updatable Records:** Add a secure `updateMarksheet` function (also `onlyOwner`) to handle cases of re-evaluation or corrections.

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to fork the repo, make your changes, and submit a pull request.

---

## 📜 License

This project is distributed under the MIT License. See `LICENSE.txt` for more information.


