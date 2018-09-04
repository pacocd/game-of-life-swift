//
//  BoardCell.swift
//  game-of-life
//
//  Created by Francisco Chacon on 8/13/18.
//  Copyright © 2018 Francisco Javier Chacón de Dios. All rights reserved.
//

import UIKit

class BoardCell: UICollectionViewCell {

    static let identifier: String = "BoardCell"
    let customBorderWidth: CGFloat = 1
    var cell: Cell? {
        didSet {
            if let cell = cell {
                setBackgroundColor(using: cell)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = customBorderWidth
        self.layer.borderColor = UIColor.black.cgColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = customBorderWidth
        self.layer.borderColor = UIColor.black.cgColor
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = customBorderWidth
        self.layer.borderColor = UIColor.black.cgColor
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cell = nil
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }

    func setBackgroundColor(using cell: Cell) {
        if cell.state == .alive {
            self.backgroundColor = .black
        } else {
            self.backgroundColor = .white
        }
    }
}

