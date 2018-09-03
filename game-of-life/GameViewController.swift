//
//  GameViewController.swift
//  game-of-life
//
//  Created by Francisco Chacon on 8/13/18.
//  Copyright © 2018 Francisco Javier Chacón de Dios. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    let cellsPerLine: CGFloat = 10
    let numberOfCells: Int = 100
    let boardView: BoardView = BoardView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDelegates()


        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let cellSize: CGFloat = view.bounds.width / cellsPerLine
        boardView.board.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.identifier)

        if let layout = boardView.board.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: cellSize, height: cellSize)
        }
        view.addSubview(boardView)
        startGame()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let boardViewWidthConstraints: [NSLayoutConstraint] =
            NSLayoutConstraint.constraints(withVisualFormat: "|-0-[boardView]-0-|",
                                           options: .alignAllCenterX,
                                           metrics: nil,
                                           views: ["boardView": boardView])
        let boardViewHeightConstraints: [NSLayoutConstraint] =
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[boardView]-0-|",
                                           options: .alignAllCenterY,
                                           metrics: nil,
                                           views: ["boardView": boardView])

        view.addConstraints(boardViewWidthConstraints)
        view.addConstraints(boardViewHeightConstraints
        )
    }

    func setDelegates() {
        boardView.board.delegate = self
        boardView.board.dataSource = self
    }

    func startGame() {
        let reloadBoard = { [weak self] () -> Void in
            self?.boardView.board.reloadData()
        }
        GameContainer.shared.fillWorld(cells: numberOfCells,
                                       completion: reloadBoard)
    }

}

extension GameViewController: UICollectionViewDelegate {
}

extension GameViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GameContainer.shared.universe.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = boardView.board.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier,
                                                       for: indexPath) as! BoardCell
        cell.cell = GameContainer.shared.universe[indexPath.row]
        return cell
    }

}
