// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarksheetVerification {
    // Owner (college admin)
    address public owner;

    // Structure to store marksheet details
    struct Marksheet {
        string studentName;
        uint256 rollNumber;
        string courseName;
        uint8 marks;
        bool isVerified;
    }

    // Mapping roll number → marksheet
    mapping(uint256 => Marksheet) public marksheets;

    // Event for record addition
    event MarksheetAdded(uint256 rollNumber, string studentName, string courseName, uint8 marks);

    // Modifier: only admin can perform certain actions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only admin can perform this action");
        _;
    }

    // Constructor sets contract deployer as owner
    constructor() {
        owner = msg.sender;
    }

    // Function to add a new marksheet
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

    // Function to verify a marksheet
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
