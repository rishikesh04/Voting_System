// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    // ----------------------------
    // STRUCTS & STATE VARIABLES
    // ----------------------------

    struct Proposal {
        string name;        // Name of the proposal
        uint256 voteCount;  // Total votes received
    }

    mapping(address => bool) public hasVoted;  // Tracks if an address has voted
    Proposal[] public proposals;               // Dynamic list of proposals
    address public owner;                      // Contract deployer (admin)

    // ----------------------------
    // EVENTS
    // ----------------------------
    event ProposalAdded(string name);
    event Voted(address voter, uint256 proposalIndex);
    event WinnerAnnounced(string winnerName, uint256 votes);

    // ----------------------------
    // MODIFIERS
    // ----------------------------
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can do this");
        _;
    }

    // ----------------------------
    // CONSTRUCTOR
    // ----------------------------
    constructor() {
        owner = msg.sender; // The one who deploys becomes the admin
    }

    // ----------------------------
    // FUNCTIONS
    // ----------------------------

    // Add a new proposal (only the owner)
    function addProposal(string memory _name) public onlyOwner {
        proposals.push(Proposal({name: _name, voteCount: 0}));
        emit ProposalAdded(_name);
    }

    // Vote for a proposal by index
    function vote(uint256 proposalIndex) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(proposalIndex < proposals.length, "Invalid proposal index");

        hasVoted[msg.sender] = true;
        proposals[proposalIndex].voteCount += 1;

        emit Voted(msg.sender, proposalIndex);
    }

    // Get the total number of proposals
    function getProposalCount() public view returns (uint256) {
        return proposals.length;
    }

    // Get the winner proposal (by highest votes)
    function getWinner() public returns (string memory winnerName, uint256 votes) {
        require(proposals.length > 0, "No proposals available");

        uint256 winningVoteCount = 0;
        uint256 winningIndex = 0;

        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningIndex = i;
            }
        }

        emit WinnerAnnounced(proposals[winningIndex].name, proposals[winningIndex].voteCount);
        return (proposals[winningIndex].name, proposals[winningIndex].voteCount);
    }
}
