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
  });

  it('should return empty address list when not existed user id given', async () => {
    const address = await whoIsInstance.getPublicAddressesById.call("unknown");
    expect(address).to.be.empty;
  });

  it('should return empty user id if unregistered public address given', async () => {
    const userId = await whoIsInstance.getUserIdByPublicAddress.call(accounts[0]);
    expect(userId).to.be.empty;
  });

  describe('Register new user', () => {
    it('should create new id and map with public key', async () => {
      // when
      const userId = await whoIsInstance.registerNewUser({from: accounts[0]});

      // then
      expect(userId).to.be.not.empty;
      let userAddresses = await whoIsInstance.getPublicAddressesById(userId);
      expect(userAddresses).to.contains(accounts[0]);
      let savedUserId = await whoIsInstance.getUserIdByPublicAddress(accounts[0]);
      expect(savedUserId).to.be.equal(userId);
      // console.log(await whoIsInstance.userIdToPublicKey.call("tst"));
      // const address = await whoIsInstance.userIdToPublicKey.call(userId);
      // assert.equal(address, accounts[0]);
    });
  });
});
