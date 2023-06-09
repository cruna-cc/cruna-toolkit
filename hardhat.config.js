require("@nomiclabs/hardhat-waffle");
require("@openzeppelin/hardhat-upgrades");

require("solidity-coverage");
if (process.env.GAS_REPORT) {
  require("hardhat-gas-reporter");
}


module.exports = {
  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks: {
    hardhat: {
      blockGasLimit: 10000000,
    },
    localhost: {
      url: "http://localhost:8545",
    }
  },
};
