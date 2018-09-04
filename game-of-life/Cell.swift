//
//  Cell.swift
//  game-of-life
//
//  Created by Francisco Chacon on 8/13/18.
//  Copyright © 2018 Francisco Javier Chacón de Dios. All rights reserved.
//

import Foundation

class Cell {
    let x: Int
    let y: Int
    var state: State

    init(x: Int, y: Int, state: State) {
        self.x = x
        self.y = y
        self.state = state
    }

}

enum State {
    case dead, alive
}
