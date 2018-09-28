//
//  CellEvaluator.swift
//  game-of-life
//
//  Created by Francisco Chacon on 8/31/18.
//  Copyright © 2018 Francisco Javier Chacón de Dios. All rights reserved.
//

import Foundation

class Game {

    sdfgsdfgsd
    sdfsdfsd
    sdfsdf
    dsgarga
    
    static let shared: Game = Game(dimensions: 400)
    var universe: Universe
    var dimensions: Int

    init(dimensions: Int) {
        universe = Universe(dimensions: dimensions)
        self.dimensions = dimensions
    }

    func fillWorld(cells number: Int, completion callback: @escaping () -> Void) {
        for (index, _) in universe.cells.enumerated() {
            universe.cells[index].state = getRandomState()
        }
        callback()
    }

    func nextGen() {
        let deadCells = universe.cells.filter { $0.state == .dead }
        let livingCells = universe.cells.filter { $0.state == .alive }

        print(deadCells.count)
        print(livingCells.count)
    }

    func getNeighbours(for cell: Cell) -> [Cell] {
        return universe.cells.filter { cellsAreNeighbours(cell1: cell, cell2: $0) }
    }

    func getNumberLivingNeighbours(for cell: Cell) -> Int {
        return getNeighbours(for: cell).filter { $0.state == .alive }.count
    }

    func cellsAreNeighbours(cell1: Cell, cell2: Cell) -> Bool {
        let resultCoords = (abs(cell1.x - cell2.x), abs(cell1.y - cell2.y))
        switch resultCoords {
        case (1, 1), (1, 0), (0, 1):
            return true
        default:
            return false
        }
    }

    fileprivate func getRandomState() -> State {
        if (arc4random_uniform(2) == 1) {
            return .alive
        }
        return .dead
    }

}
