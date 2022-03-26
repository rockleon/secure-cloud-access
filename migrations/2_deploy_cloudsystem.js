const CloudSystem = artifacts.require("CloudSystem");

module.exports = function (deployer) {
    deployer.deploy(CloudSystem);
};