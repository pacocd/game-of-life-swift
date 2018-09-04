//
//  Board.swift
//  game-of-life
//
//  Created by Francisco Chacon on 9/3/18.
//  Copyright © 2018 Francisco Javier Chacón de Dios. All rights reserved.
//

import Foundation
import UIKit

@objc protocol Board {
    var board: UICollectionView { get }
    var startButton: UIButton? { get }
    var pauseButton: UIButton? { get }
    var resetButton: UIButton? { get }
    var endButton: UIButton? { get }
    var delegate: BoardDelegate? { get set }
    init()
}

@objc protocol BoardDelegate {
    func start(game board: Board)
    @objc optional func willStart(game board: Board)
    @objc optional func didStart(game board: Board)
    func pause(game board: Board)
    func reset(game board: Board)
    func end(game board: Board)
    @objc optional func willEnd(game board: Board)
    @objc optional func didEnd(game board: Board)
}

class BoardView: UIView, Board {
    var resetButton: UIButton?
    var endButton: UIButton?
    var startButton: UIButton?
    var pauseButton: UIButton?
    lazy var board = { [unowned self] () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        let collectionViewSize: CGFloat = bounds.width
        let collectionView = UICollectionView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: collectionViewSize,
                height: collectionViewSize),
            collectionViewLayout: layout
        )
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 0,
                                           bottom: 0,
                                           right: 0)
        layout.itemSize = CGSize(width: 10,
                                 height: 10)
        layout.estimatedItemSize = CGSize(width: 10,
                                          height: 10)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = -0.1

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizesSubviews = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    var delegate: BoardDelegate?

    convenience required init() {
        self.init(frame: CGRect(x: 0,
                                y: 0,
                                width: 0,
                                height: 0))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
        setLayouts()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
        setLayouts()
    }

    func initializeView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(board)
    }

    func setLayouts() {
        let boardHeighConstraint = NSLayoutConstraint(item: board,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .width,
                                                      multiplier: 1,
                                                      constant: 0)
        let boardWidthConstraint =
            NSLayoutConstraint.constraints(withVisualFormat: "|-0-[board]-0-|",
                                           options: .alignAllCenterX,
                                           metrics: nil,
                                           views: ["board": board])
        let boardCenterY = NSLayoutConstraint(item: board,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerY,
                                              multiplier: 1,
                                              constant: 0)

        self.addConstraints(boardWidthConstraint)
        self.addConstraints([boardHeighConstraint, boardCenterY])
    }
}
