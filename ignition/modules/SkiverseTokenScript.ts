

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const NAME: string = "SkiverseToken";
const SYMBOL: string = "SKI";
const OWNER: string = "0xDA2D8d0afd00F6166d7eB4D3bABC8bBe6b6946ec";

const SkiverseModule = buildModule("SkiverseTokenModule", (m) => {
  const name = m.getParameter("_name", NAME);
  const symbol_ = m.getParameter("_symbol", SYMBOL);
  const owner = m.getParameter("_owner", OWNER);

  const lock = m.contract("SkiverseToken", [
    name, symbol_, owner
  ], {});

  return { lock };
});

export default SkiverseModule;

// game token 0x579418eef703ccE9ef1eDDb9Fa54CacD2cbb7396
