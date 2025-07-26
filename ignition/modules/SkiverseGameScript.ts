

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const TOKEN_ADDRESS: string = "0x579418eef703ccE9ef1eDDb9Fa54CacD2cbb7396";

const SkiverseModule = buildModule("SkiverseGameModule", (m) => {
  const token_address = m.getParameter("_gameToken", TOKEN_ADDRESS);

  const lock = m.contract("SkiverseGame", [
    token_address
  ], {});

  return { lock };
});

export default SkiverseModule;

// game token 0x579418eef703ccE9ef1eDDb9Fa54CacD2cbb7396

// skiverse game 0xB60A331F9838761462b702C50c0c670bAe6eCf58
