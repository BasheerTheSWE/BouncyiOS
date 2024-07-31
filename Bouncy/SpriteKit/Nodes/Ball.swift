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
    
    var movement = CGVector(dx: 5, dy: 5)
    
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
        // Creating a tail ball node:
        let tailBall = SKShapeNode(circleOfRadius: radius)
        tailBall.fillColor = .gameLightBlue
        tailBall.lineWidth = 0
        tailBall.position = position
        
        // Creating a tail line node:
        let tailLineStartingPoint = position
        let tailLineEndingPoint = CGPoint(x: position.x + movement.dx, y: position.y + movement.dy)
        
        let deltaY = tailLineStartingPoint.y - tailLineEndingPoint.y
        let deltaX = tailLineStartingPoint.x - tailLineEndingPoint.x
        let distance = sqrt(pow(deltaX, 2) + pow(deltaY, 2))
        let angle = atan2(deltaY, deltaX)
        
        let tailLine = SKShapeNode(rectOf: CGSize(width: distance, height: radius * 2))
        tailLine.lineWidth = 0
        tailLine.fillColor = .gameLightBlue
        tailLine.zRotation = angle
        tailLine.position = CGPoint(x: (tailLineStartingPoint.x + tailLineEndingPoint.x) / 2, y: (tailLineStartingPoint.y + tailLineEndingPoint.y) / 2)
        
        // Scaling the tail nodes down to make a disappearing tail effect:
        let shrinkBall = SKAction.scale(by: 0, duration: 1)
        let shrinkLine = SKAction.scaleY(to: 0, duration: 1)
        shrinkBall.timingMode = .linear
        shrinkLine.timingMode = .linear
        
        tailBall.run(shrinkBall) { tailBall.removeFromParent() }
        tailLine.run(shrinkLine) { tailLine.removeFromParent() }
        
        // Displaying the tail nodes:
        scene?.addChild(tailLine)
        scene?.addChild(tailBall)
        
        // Updating the ball's position:
        position.x += movement.dx
        position.y += movement.dy
    }
}
