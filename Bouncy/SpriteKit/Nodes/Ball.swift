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
    
    var movement = CGVector(dx: 10, dy: 10)
    
    // MARK: - INIT
    init(size: CGSize) {
        self.size = size
        self.radius = size.width / 2
        super.init()
        
        name = NodeName.ball.rawValue
        zPosition = ZPosition.ball.rawValue
        
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
        shape.zPosition = ZPosition.ball.rawValue
        shape.fillColor = .gameLightBlue
        shape.lineWidth = 0
        shape.position = .zero
        
        let secondaryShape = SKShapeNode(circleOfRadius: radius / 2)
        secondaryShape.zPosition = ZPosition.ballEffect.rawValue
        secondaryShape.fillColor = .white
        secondaryShape.lineWidth = 0
        secondaryShape.position = .zero
        
        shape.addChild(secondaryShape)
        
        addChild(shape)
    }
    
    // MARK: - UPDATE
    func update() {
        // Creating a tail ball node:
        let tailBall = SKShapeNode(circleOfRadius: radius)
        tailBall.zPosition = ZPosition.ball.rawValue
        tailBall.fillColor = .gameLightBlue
        tailBall.lineWidth = 0
        tailBall.position = position
        
        let tailSecondaryBall = SKShapeNode(circleOfRadius: radius / 2)
        tailSecondaryBall.zPosition = ZPosition.ballEffect.rawValue
        tailSecondaryBall.fillColor = .white
        tailSecondaryBall.lineWidth = 0
        tailSecondaryBall.position = .zero
        
        tailBall.addChild(tailSecondaryBall)
        
        // Creating a tail line node:
        let tailLineStartingPoint = position
        let tailLineEndingPoint = CGPoint(x: position.x + movement.dx, y: position.y + movement.dy)
        
        let deltaY = tailLineStartingPoint.y - tailLineEndingPoint.y
        let deltaX = tailLineStartingPoint.x - tailLineEndingPoint.x
        let distance = sqrt(pow(deltaX, 2) + pow(deltaY, 2))
        let angle = atan2(deltaY, deltaX)
        
        let tailLine = SKShapeNode(rectOf: CGSize(width: distance, height: radius * 2))
        tailLine.zPosition = ZPosition.ball.rawValue
        tailLine.lineWidth = 0
        tailLine.fillColor = .gameLightBlue
        tailLine.zRotation = angle
        tailLine.position = CGPoint(x: (tailLineStartingPoint.x + tailLineEndingPoint.x) / 2, y: (tailLineStartingPoint.y + tailLineEndingPoint.y) / 2)
        
        let tailSecondaryLine = SKShapeNode(rectOf: CGSize(width: distance, height: radius))
        tailSecondaryLine.zPosition = ZPosition.ballEffect.rawValue
        tailSecondaryLine.lineWidth = 0
        tailSecondaryLine.fillColor = .white
        tailSecondaryLine.position = .zero
        
        tailLine.addChild(tailSecondaryLine)
        
        // Scaling the tail nodes down to make a disappearing tail effect:
        let shrinkBall = SKAction.scale(by: 0, duration: 0.5)
        let shrinkLine = SKAction.scaleY(to: 0, duration: 0.5)
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
