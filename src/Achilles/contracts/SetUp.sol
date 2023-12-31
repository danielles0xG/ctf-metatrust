// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Achilles.sol";
import "./WETH.sol";
import "./Interface.sol";
import "./PancakeSwap.sol";

contract SetUp {

    PancakePair public pair = new PancakePair();
    WETH public weth = new WETH();
    Achilles public achilles = new Achilles(address(pair), address(weth));

    constructor() {
        pair.initialize(address(achilles), address(weth));
        achilles.transfer(address(pair), achilles.balanceOf(address(this)));
        weth.transfer(address(pair), weth.balanceOf(address(this)));
        pair.sync();
    }

    function isSolved() public view returns(bool) {
        require(pair.unlocked()==1);
        require(weth.balanceOf(msg.sender) >= 100 ether);
        return true;
    }
}