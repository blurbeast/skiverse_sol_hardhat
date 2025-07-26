import { HardhatUserConfig, vars } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";


const RPC_URL = vars.get("RPC_URL");
const PK = vars.get("S_PK");
const ETHERSCAN = vars.get("ETHER_SCAN");

const SKIVERSE_PK = vars.get("SKIVERSE_PK");

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  // networks: {
  //   sepolia: {
  //     url: RPC_URL,
  //     accounts: [PK],
  //   },
  // },
  // etherscan: {
  //   apiKey: {
  //     sepolia: ETHERSCAN
  //   }
  // }
  // 
  networks: {
    'somnia-testnet': {
      url: 'https://dream-rpc.somnia.network/',
      accounts: [ SKIVERSE_PK ]
    },
  },
  etherscan: {
    apiKey: {
      'somnia-testnet': 'empty'
    },
    customChains: [
      {
        network: "somnia-testnet",
        chainId: 50312,
        urls: {
          apiURL: "https://somnia.w3us.site/api",
          browserURL: "https://somnia.w3us.site"
        }
      }
    ]
  }
};

export default config;
