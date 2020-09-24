//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Sammy Alvarado on 9/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    private enum Mark: Equatable {
        case x
        case o
        case empty

        var stringValue: String {
            switch self {
            case .x: return "X"
            case .o: return "O"
            case .empty: return " "
            }
        }
    }

    private var app: XCUIApplication {
        return XCUIApplication()
    }

    private var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }

    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.TurnLabel"]
    }

    private func bottomFor(_ index: Int) -> XCUIElement {
        return app.buttons["button\(index)"]
    }

    override func setUp() {

        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()


    }


    func testWinCheckingVertical1() {
        /*
         0 1 2
         3 4 5
         6 7 8
         */

        /*
         x o -
         x o -
         x - -
         */
        let button0 = bottomFor(0)
        let button1 = bottomFor(1)
        let button2 = bottomFor(2)
        let button3 = bottomFor(3)
        let button4 = bottomFor(4)
        let button6 = bottomFor(6)

        button0.tap()
        XCTAssertEqual(turnLabel.label, "Player 0's turn")
        XCTAssertEqual(button0.label, Mark.x.stringValue)

        button1
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        XCTAssertEqual(button1.label, Mark.o.stringValue)

        button3.tap()
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        XCTAssertEqual(button3.label, Mark.x.stringValue)

//        button4
//        button6
    }

    func testWinCheckingDiagonalRTL() {
        /*
         0 1 2
         3 4 5
         6 7 8
         */

        /*
         x o -
         o x -
         o - x
         */
        let button0 = bottomFor(0)//x
        let button1 = bottomFor(1)//0
        let button2 = bottomFor(3) // empty
        let button3 = bottomFor(4) // o
        let button4 = bottomFor(6) // x
        let button6 = bottomFor(8)

        button0.tap()
        XCTAssertEqual(turnLabel.label, "Player 0's turn")
        XCTAssertEqual(button0.label, Mark.x.stringValue)

        button1.tap()
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        XCTAssertEqual(button1.label, Mark.o.stringValue)

        button3.tap()
        XCTAssertEqual(turnLabel.label, "Player O's Turn")
        XCTAssertEqual(button3.label, Mark.o.stringValue)
    }

    func testRestartingGame() {
        let button4 = bottomFor(4)
        button4.tap()

        XCTAssertEqual(turnLabel.label, Mark.x.stringValue)

        XCTAssertEqual(turnLabel.label, "Player O's turn")

        restartButton.tap()

        for i in 0...8 {
            XCTAssertEqual(bottomFor(i).label, Mark.empty.stringValue)
        }
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
    }
}
