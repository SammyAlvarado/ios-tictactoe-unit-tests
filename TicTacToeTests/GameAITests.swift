//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Sammy Alvarado on 9/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    // Vertical 1-3
    /*
     x o -
     x o -
     x - -
     */

    func testWinCheckingVertical1() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingVertical2() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingVertical3() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }


    // Horizontal 1-3
    func testWinCheckingHorizontal1() {
        var board = GameBoard()

        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 0))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingHorizontal2() {
        /*
         o o -
         x x x
         - - -
         */
        var board = GameBoard()

        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingHorizontal3() {
        /*
         o o -
         x x x
         - - -
         */
        var board = GameBoard()

        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }


    // Diagonal rt1, 1tr
    func testWinDiagano1RTL() {

        var board = GameBoard()

        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))

    }

    func testWinDiagano2RTL() {

        var board = GameBoard()

        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 2))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))

    }



    // Incomplete game
    func testWinCheckingIncompleteGame() {
        /*
         x _ o
         - o -
         - x -
         */
        var board = GameBoard()

        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }

    // Cats Game

    func testCatsGame() {
        var board = GameBoard()
        /*
         x o x
         x o o
         o x x
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
}
