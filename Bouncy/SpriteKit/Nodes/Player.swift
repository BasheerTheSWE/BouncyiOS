//
//  Player.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 29/07/2024.
//

import SpriteKit

final class Player: SKNode {
    
    var size: CGSize = .zero
    
    init(size: CGSize) {
        self.size = size
        super.init()
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = false
        physicsBody?.allowsRotation = false
        
        setShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DESIGN
    private func setShape() {
        let shape = SKShapeNode(rectOf: size)
        shape.fillColor = .white
        shape.lineWidth = 0
        shape.position = CGPoint(x: 0, y: 0)
        
        addChild(shape)
    }
    
    // MARK: - BEHAVIOR
    func changePosition(towards location: CGPoint) {
        guard let sceneWidth = scene?.size.width else { return }
        let x = location.x
        
        if x > size.width / 2 + 10 && x < sceneWidth - size.width / 2 - 10 {
            position.x = location.x
        } else if x < size.width / 2 + 10 {
            position.x = size.width / 2 + 10
        } else if x > sceneWidth - size.width / 2 - 10 {
            position.x = sceneWidth - size.width / 2 - 10
        }
    }
}