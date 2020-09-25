//
//  Game.swift
//  TicTacToe
//
//  Created by Sammy Alvarado on 9/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {

    var viewController: GameViewController?

    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?






    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)


    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }


}
