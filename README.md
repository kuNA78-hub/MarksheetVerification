# MarksheetVerification
# 🎓 Blockchain-Based Marksheet Verification System

A simple Solidity smart contract that allows educational institutions to **issue and verify student marksheets** on the blockchain — ensuring **authenticity**, **transparency**, and **tamper-proof verification**.

---

## 🧠 Overview

Traditional marksheets can be easily forged or lost.  
This project uses **Ethereum blockchain** to store verified academic records securely.

- 🏫 **Admin (Institute)** adds verified marksheets.  
- 👩‍🎓 **Students / Employers** can verify marksheets using roll numbers.  
- 🔒 All data is immutable and publicly verifiable.

---
contact link 
https://repo.sourcify.dev/11142220/0x223feCD20263f08A9F96E5030b0D8db0317c4c8b/

## ⚙️ Tech Stack

| Component | Technology Used |
|------------|-----------------|
| Smart Contract | Solidity (v0.8.x) |
| Blockchain Network | Ethereum Testnet (Sepolia) |
| Development Environment | Remix IDE |
| Wallet | MetaMask |

---

## 📁 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarksheetVerification {
    address public owner;

    struct Marksheet {
        string studentName;
        uint256 rollNumber;
        string courseName;
        uint8 marks;
        bool isVerified;
    }

    mapping(uint256 => Marksheet) public marksheets;

    event MarksheetAdded(uint256 rollNumber, string studentName, string courseName, uint8 marks);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only admin can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addMarksheet(
        string memory _studentName,
        uint256 _rollNumber,
        string memory _courseName,
        uint8 _marks
    ) public onlyOwner {
        require(!marksheets[_rollNumber].isVerified, "Marksheet already exists");

        marksheets[_rollNumber] = Marksheet({
            studentName: _studentName,
            rollNumber: _rollNumber,
            courseName: _courseName,
            marks: _marks,
            isVerified: true
        });

        emit MarksheetAdded(_rollNumber, _studentName, _courseName, _marks);
    }

    function verifyMarksheet(uint256 _rollNumber)
        public
        view
        returns (string memory, string memory, uint8, bool)
    {
        Marksheet memory m = marksheets[_rollNumber];
        require(m.isVerified, "Marksheet not found");
        return (m.studentName, m.courseName, m.marks, m.isVerified);
    }
}
🚀 Deployment Guide (Using Remix & MetaMask)
1️⃣ Setup
Go to Remix IDE

Create a new file → MarksheetVerification.sol

Paste the code above.

Compile the contract using Solidity compiler v0.8.x

2️⃣ Connect MetaMask
Open MetaMask in your browser.

Enable test networks → Switch to Sepolia Testnet.

Get free test ETH from a faucet:
🔗 https://sepoliafaucet.com/

3️⃣ Deploy
In Remix → Go to Deploy & Run Transactions tab.

Set Environment → Injected Provider - MetaMask.

Click Deploy and confirm in MetaMask.

4️⃣ Test the Contract
Call addMarksheet("Kunal", 101, "B.Tech IT", 95) as admin.

Use verifyMarksheet(101) to verify on-chain data.

🧩 Features
✅ Admin-only marksheet creation
✅ Public verification via roll number
✅ Immutable and tamper-proof storage
✅ Event logging for audit trail

💡 Future Enhancements
🌐 Build a React.js + Ethers.js frontend for user-friendly verification

📄 Integrate IPFS to store digital mark PDF files

🔐 Add role-based access (multiple authorized admins)

🧮 Support multiple subjects and grades

🧑‍💻 Author
Kunal Kumar Prasad
🎓 B.Tech in Information Technology — Narula Institute of Technology
📊 B.Sc in Computer Science & Data Analytics — IIT Patna
💬 Passionate about Blockchain, Web Development & AI Integration

🪙 License
This project is licensed under the MIT License — feel free to use and modify.


contact  link

