const WhoIs = artifacts.require("WhoIs");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("WhoIs", function (accounts) {
  let whoIsInstance;
  beforeEach(async () => {
    whoIsInstance = await WhoIs.deployed();
  })
  describe('Register new user', () => {
    it('should add new user into userToPublicKey mapping', async () => {
      let userId = "my-user-id";
      await whoIsInstance.registerNewUser.call(userId);
      const address = await whoIsInstance.userIdToPublicKey.call(userId);
      assert.equal(address, accounts[0]);
    });
  });
});
