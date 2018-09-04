//
//  World.swift
//  game-of-life
//
//  Created by Francisco Chacon on 9/3/18.
//  Copyright © 2018 Francisco Javier Chacón de Dios. All rights reserved.
//

import Foundation

class Universe {
    var cells: [Cell]
    let dimensions: Int

    init(dimensions: Int) {
        self.dimensions = dimensions
        let cellsPerLine = Int(sqrt(Double(dimensions)))
        cells = [Cell]()
        for x in 0..<cellsPerLine {
            for y in 0..<cellsPerLine {
                cells.append(Cell(x: x, y: y, state: .dead))
            }
        }
    }

    subscript(x: Int, y: Int) -> Cell? {
        return cells.filter { $0.x == x && $0.y == y }.first
    }
}
