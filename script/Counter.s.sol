// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {SetUp} from "../src/guessgame/contracts/A.sol";

contract CounterScript is Script {
    function setUp() public {
        
    }

    function run() public {
        vm.broadcast();
    }
}
