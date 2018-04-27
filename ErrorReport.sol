pragma solidity ^0.4.21;

/**
 * @title Add error logging
 * @dev StandardToken modified with pausable transfers.
 **/
library ErrorReport {
    //TODO Add more standard error codes 
    uint public constant REQUIRE_FAILED = 0x132;

    event ExceptionRaised(address caller, uint errorCode, string message);

    function raiseException(uint errorCode, string message) public {
        emit ExceptionRaised(msg.sender, errorCode, message);
    }

    //TODO Maybe overload require(bool) ?
    function requireMsg(bool result, string message) public {
        if (!result) {
            raiseException(REQUIRE_FAILED, message);
            revert();
        }
    }
}
