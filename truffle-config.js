
require('dotenv').config();
// const { MNEMONIC, PROJECT_ID } = process.env;

// const HDWalletProvider = require('@truffle/hdwallet-provider');

const path = require("path");
const infuraProjectId = "b636c84e1cd24c18b28382e3c25b3058"

module.exports = {
  networks: {
    development: {
     host: "127.0.0.1",     // Localhost (default: none)
     port: 7545,            // Standard Ethereum port (default: none)
     network_id: "*",       // Any network (default: none)
     from: '0x428A296D152884ffa13BC9D04C733A2cdD8787e3',
    },
    //polygon Infura mainnet
    polygon_infura_mainnet: {
      provider: () => new HDWalletProvider({
        mnemonic: {
          phrase: mnemonic
        },
        providerOrUrl:
         "https://polygon-mainnet.infura.io/v3/" + infuraProjectId
      }),
      network_id: 137,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
      chainId: 137
    },
    //polygon Infura testnet
    polygon_mumbai: {
      provider: () => new HDWalletProvider({
        mnemonic: {
          phrase: mnemonic
        },
        providerOrUrl:
         "https://polygon-mumbai.infura.io/v3/" + infuraProjectId
      }),
      network_id: 80001,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
      chainId: 80001
    }
  },
  contracts_build_directory: path.join(__dirname, "build/"),
  // mocha: {
  //    timeout: 100000
  // },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.17",    
      // docker: true,   
      settings: {          
       optimizer: {
         enabled: false,
         runs: 200
       },
       evmVersion: "byzantium"
      }
    }
  },
  // db: {
  //   enabled: false,
  //   host: "127.0.0.1",
  //   adapter: {
  //     name: "sqlite",
  //     settings: {
  //       directory: ".db"
  //     }
  //   }
  // }
};