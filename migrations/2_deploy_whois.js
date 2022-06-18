const whoIs = artifacts.require("WhoIs");

module.exports = function (deployer) {
  deployer.deploy(whoIs);
};
