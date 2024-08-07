//
//  Player.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 29/07/2024.
//

import SpriteKit

final class Player: SKNode {
    
    var size: CGSize = .zero
    let board = Board()
    
    // Jumping vars
    var isJumping = false
    let jumpCounterBounds: (CGFloat, CGFloat) = (20, -20)
    lazy var jumpCounter = jumpCounterBounds.0
    
    init(size: CGSize) {
        self.size = size
        super.init()
        
        zPosition = ZPosition.player.rawValue
        setShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DESIGN
    private func setShape() {
//        let shape = SKShapeNode(rectOf: size, cornerRadius: 4)
//        shape.zPosition = ZPosition.player.rawValue
//        shape.fillColor = .gamePrimary
//        shape.lineWidth = 0
        board.position = CGPoint(x: 0, y: 0)
        
        addChild(board)
    }
    
    // MARK: - BEHAVIOR
    func changePosition(towards location: CGPoint) {
        guard let scene = scene as? GameScene else { return }
        let sceneMargin = scene.sceneMargin
        
        if location.x <= sceneMargin.leading + size.width / 2 + 2 {
            position.x = sceneMargin.leading + size.width / 2 + 2
            return
        }
        
        if location.x >= scene.size.width - sceneMargin.trailing - size.width / 2 - 2 {
            position.x = scene.size.width - sceneMargin.trailing - size.width / 2 - 2
            return
        }
        
        position.x = location.x
    }
    
    func jump() {
        isJumping = true
    }
    
    // MARK: - UPDATE
    func update() {
        // Jumping
        if isJumping {
            position.y += jumpCounter / 2
            
            if jumpCounter > jumpCounterBounds.1 {
                jumpCounter -= 1
            } else {
                jumpCounter = jumpCounterBounds.0
                isJumping = false
            }
        }
    }
}
