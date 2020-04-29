
pragma solidity ^0.5.0;

contract  Election {
    //Model a candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;

    }
    //Store account that have voted
    mapping (address => bool) public voters;
    
    
    //Store candidate
    //Fetch candidate

    mapping (uint => Candidate) public candidates;
    //store candidates voteCount

    uint public candidatesCount;


    constructor() public {
        addCandidate("Logan Paul");
        addCandidate("Felix");
        addCandidate("Vedant Jajoo");
        addCandidate("Bhuwan Bam");
        addCandidate("None of the above");


    }

    function addCandidate (string memory _name) private {

        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name
            , 0);
    }

    event votedEvent (
        uint indexed _candidateId
    );

   function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        emit votedEvent(_candidateId);
}
    
    
}

