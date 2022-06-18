// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "truffle/Console.sol";

contract WhoIs {
    mapping(address => string) public publicKeyToUserId;
    mapping(string => address) public userIdToPublicKey;

    constructor() {
        publicKeyToUserId[0xc2AE2D5523080b64CC788CDDc91FF59a3E29F911] = "tst";
    }

    function registerNewUser(string memory userId) public {
//        require(bytes(PublicKeyToUserId[msg.sender]).length > 0);
        Console.log(msg.sender);
        Console.log(userId);
        userIdToPublicKey[userId] = msg.sender;
    }
}
