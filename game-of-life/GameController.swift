//
//  CellEvaluator.swift
//  game-of-life
//
//  Created by Francisco Chacon on 8/31/18.
//  Copyright © 2018 Francisco Javier Chacón de Dios. All rights reserved.
//

import Foundation

class GameContainer {

    static let shared: GameContainer = GameContainer()
    var universe: [Cell] = []

    func fillWorld(cells number: Int, completion callback: @escaping () -> Void) {
        autoreleasepool { () -> Void in
            for _ in (0..<number) {
                universe.append(Cell(isAlive: randomState()))
            }
        }
        
        callback()
    }

    fileprivate func randomState() -> Bool {
        if (arc4random_uniform(2) == 1) {
            return true
        }
        return false
    }

}
