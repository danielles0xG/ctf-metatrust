// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {GuessGame,A} from "../src/guessgame/contracts/A.sol";



contract Fallbacker {
    function ctf(address _random03) external view returns(uint256){
       (, bytes memory data) = address(_random03).staticcall("Fallbacker()");
       return data.length;
    }
}
contract GuessGameTest is Test {
    A public a ;
    GuessGame public guessGame;
    Fallbacker public fallbacker;

    function setUp() public {
        a = new A();
        guessGame = new GuessGame(a);
        fallbacker = new Fallbacker();
    }

    function test_fuzzGuessGame(
        uint256 _random01,
        uint256 _random02,
        uint256 _random03,
        uint256 _random04
    ) public {
        // vm.assume();
        guessGame.guess{value:1}(
            96,
            121, //135
            3,
            10
        );
    }

    function test_a() public {

        // vm.assume(_random03 > address(uint160(1)));
        // vm.assume(_random03 < address(uint160(0x0000000000fFff8545DcFcb03fCB875F56bedDc4)));
        // try fallbacker.ctf(_random03)returns(uint256 dataSize){
        //       vm.assume(dataSize >= 32);
        // }catch { console.log("Fuzzing..."); }

        // y = 1390849295786071768276380950238675083608645509769 = 0
        // 1111001110011111110101101110010100011010101011011000100011110110111101001100111001101010101110001000001001110010011110011100111111111111101110010010001000000010
        // n = 1390849295786071768276380950238675083608645509890

        // & 0xff: This is a bitwise AND operation. 
        // It masks the result of the previous operations, effectively keeping only the last 8 bits of the value (since 0xff is 11111111 in binary). This could be used to limit the size of the value to fit into a specific data type or to anonymize part of the information.

        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        guessGame.guess{value:1}(
            96,
            121,
            3,
            10
        );
}}