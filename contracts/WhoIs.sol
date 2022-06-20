// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract WhoIs {

    mapping(address => string) private publicKeyToUserId;
    mapping(string => Addresses) private userIdToPublicKey;

    constructor() {
//        publicKeyToUserId[0xc2AE2D5523080b64CC788CDDc91FF59a3E29F911] = "tst";
    }

    function registerNewUser() public {
        //        require(bytes(PublicKeyToUserId[msg.sender]).length > 0);
//        userIdToPublicKey[userId] = msg.sender;
//        userIdToPublicKey["tst"] = 0xc2AE2D5523080b64CC788CDDc91FF59a3E29F911;
        publicKeyToUserId[msg.sender] = userId;
        userIdToPublicKey[userId].addresses.push(msg.sender);
    }

    function getPublicAddressesById(string memory userId) public view returns (address[] memory) {
        return userIdToPublicKey[userId].addresses;
    }

    function getUserIdByPublicAddress(address publicAddress) public view returns (string memory) {
        return publicKeyToUserId[publicAddress];
    }

    function addAddress(string memory userId, address a) private {

//        if (!my_set.is_in[a]) {
//            my_set.values.push(a);
//            my_set.is_in[a] = true;
//        }
    }

    function createNewId(address sender) external returns (bytes20 blobId) {
        // Generate the blobId.
         keccak256(sender);
        // Make sure this blobId has not been used before.
        if (blobInfo[blobId].blockNumber != 0) {
            throw;
        }
        // Store blob info in state.
        blobInfo[blobId] = BlobInfo({
        flags: bytes4(flagsNonce),
        revisionCount: 1,
        blockNumber: uint32(block.number),
        owner: (bytes4(flagsNonce) & ANONYMOUS != 0) ? 0 : msg.sender,
        });
        // Store the first revision in a log in the current block.
        Store(blobId, 0, contents);
    }

    struct Addresses {
        address[] addresses;
        mapping(uint => bool) isIn;
    }
}
