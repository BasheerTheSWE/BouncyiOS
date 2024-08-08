//
//  Board.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 04/08/2024.
//

import SpriteKit

final class Board: SKSpriteNode {
    
    let boardType: BoardType
    var level: Int {
        didSet {
            self.texture = BoardDrawingManager.shared.drawBoard(type: boardType, level: level)
        }
    }
    
    // MARK: - INIT
    init(type boardType: BoardType, level: Int) {
        self.boardType = boardType
        self.level = level
        super.init(texture: nil, color: .clear, size: .zero)
        
        let texture = BoardDrawingManager.shared.drawBoard(type: boardType, level: level)
        self.texture = texture
        self.size = texture.size()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
