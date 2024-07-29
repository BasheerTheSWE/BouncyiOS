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
    
    // MARK: - INIT
    init(size: CGSize) {
        self.size = size
        self.radius = size.width / 2
        super.init()
        
        setPhysicsBody()
        setShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DESIGN
    private func setPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: radius)
        physicsBody?.isDynamic = false
        physicsBody?.linearDamping = 0
    }
    
    private func setShape() {
        guard children.count == 0 else { return }
        
        let shape = SKShapeNode(circleOfRadius: radius)
        shape.fillColor = .gameLightBlue
        shape.lineWidth = 0
        shape.position = .zero
        
        addChild(shape)
    }
}
