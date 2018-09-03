//
//  Cell.swift
//  game-of-life
//
//  Created by Francisco Chacon on 8/13/18.
//  Copyright © 2018 Francisco Javier Chacón de Dios. All rights reserved.
//

import Foundation

class Cell {
    var isAlive: Bool
    var neighbors: [Cell]?

    init(isAlive: Bool) {
        self.isAlive = isAlive
    }

    func countAliveNeighbors(cell neighbors: [Cell]) -> Int {
        var aliveNeighbors: Int = 0
        for neighbor in neighbors {
            if neighbor.isAlive {
                aliveNeighbors += 1
            }
        }

        return aliveNeighbors
    }
}
