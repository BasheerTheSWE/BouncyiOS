//
//  Ball.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 29/07/2024.
//

import SpriteKit

final class Ball: SKNode {
    
    let size: CGSize
    let radius: CGFloat
    
    var movement: CGVector = CGVector(dx: 5, dy: 5)
    
    // MARK: - INIT
    init(size: CGSize) {
        self.size = size
        self.radius = size.width / 2
        super.init()
        
        name = NodeName.ball.rawValue
        setPhysicsBody()
        setShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DESIGN
    private func setPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: radius)
        physicsBody?.categoryBitMask = CollisionCategory.ball.rawValue
        physicsBody?.contactTestBitMask = physicsBody?.collisionBitMask ?? 0
        physicsBody?.isDynamic = true
        physicsBody?.linearDamping = 0
        physicsBody?.affectedByGravity = false
    }
    
    private func setShape() {
        let shape = SKShapeNode(circleOfRadius: radius)
        shape.fillColor = .gameLightBlue
        shape.lineWidth = 0
        shape.position = .zero
        
        addChild(shape)
    }
    
    // MARK: - UPDATE
    func update() {
        position.x += movement.dx
        position.y += movement.dy
    }
}
