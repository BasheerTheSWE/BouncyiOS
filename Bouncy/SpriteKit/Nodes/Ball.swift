//
//  Ball.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 29/07/2024.
//

import SpriteKit

final class Ball: SKNode {
    
    private var primaryShadows = [SKShapeNode]()
    private var secondaryShadows = [SKShapeNode]()
    
    let size: CGSize
    let radius: CGFloat
    
    var movement = CGVector(dx: 5, dy: 5)
    let defaultMovement = CGVector(dx: 5, dy: 5)
    let movementIncreaseRate: CGFloat = 4
    
    private let ballPrimaryColor = UIColor.gameLightBlue
    private let ballSecondaryColor = UIColor.white
    private let fastBallPrimaryColor = UIColor.red
    private let fastBallSecondaryColor = UIColor.white
    
    private var isMovingMad = false {
        didSet {
            for shadow in primaryShadows {
                shadow.fillColor = isMovingMad ? fastBallPrimaryColor : ballPrimaryColor
            }
            
            for shadow in secondaryShadows {
                shadow.fillColor = isMovingMad ? fastBallSecondaryColor : ballSecondaryColor
            }
        }
    }
    
    // MARK: - INIT
    init(size: CGSize) {
        self.size = size
        self.radius = size.width / 2
        super.init()
        
        zPosition = ZPosition.ball.rawValue
        
        setPhysicsBody()
        drawHeadNode()
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
    
    private func drawHeadNode() {
        let shape = SKShapeNode(circleOfRadius: radius)
        shape.zPosition = ZPosition.ball.rawValue
        shape.fillColor = ballPrimaryColor
        shape.lineWidth = 0
        shape.position = .zero
        
        let secondaryShape = SKShapeNode(circleOfRadius: radius / 2)
        secondaryShape.zPosition = ZPosition.ballEffect.rawValue
        secondaryShape.fillColor = ballSecondaryColor
        secondaryShape.lineWidth = 0
        secondaryShape.position = .zero
        
        primaryShadows.append(shape)
        secondaryShadows.append(secondaryShape)
        
        shape.addChild(secondaryShape)
        addChild(shape)
    }
    
    private func drawTailNode() {
        // Creating a tail ball node:
        let tailBall = SKShapeNode(circleOfRadius: radius)
        tailBall.zPosition = ZPosition.ball.rawValue
        tailBall.fillColor = ballPrimaryColor
        tailBall.lineWidth = 0
        tailBall.position = position
        
        let tailSecondaryBall = SKShapeNode(circleOfRadius: radius / 2)
        tailSecondaryBall.zPosition = ZPosition.ballEffect.rawValue
        tailSecondaryBall.fillColor = ballSecondaryColor
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
        tailLine.fillColor = ballPrimaryColor
        tailLine.zRotation = angle
        tailLine.position = CGPoint(x: (tailLineStartingPoint.x + tailLineEndingPoint.x) / 2, y: (tailLineStartingPoint.y + tailLineEndingPoint.y) / 2)
        
        let tailSecondaryLine = SKShapeNode(rectOf: CGSize(width: distance, height: radius))
        tailSecondaryLine.zPosition = ZPosition.ballEffect.rawValue
        tailSecondaryLine.lineWidth = 0
        tailSecondaryLine.fillColor = ballSecondaryColor
        tailSecondaryLine.position = .zero
        
        tailLine.addChild(tailSecondaryLine)
        
        primaryShadows.append(tailBall)
        primaryShadows.append(tailLine)
        secondaryShadows.append(tailSecondaryBall)
        secondaryShadows.append(tailSecondaryLine)
        
        // Scaling the tail nodes down to make a disappearing tail effect:
        let shrinkBall = SKAction.scale(by: 0, duration: 0.5)
        let shrinkLine = SKAction.scaleY(to: 0, duration: 0.5)
        shrinkBall.timingMode = .linear
        shrinkLine.timingMode = .linear
        
        tailBall.run(shrinkBall) {
            tailBall.removeFromParent()
            self.primaryShadows.removeAll { $0 == tailBall }
            self.secondaryShadows.removeAll { $0 == tailSecondaryBall }
        }
        
        tailLine.run(shrinkLine) {
            tailLine.removeFromParent()
            self.primaryShadows.removeAll { $0 == tailLine }
            self.secondaryShadows.removeAll { $0 == tailSecondaryLine }
        }
        
        // Displaying the tail nodes:
        scene?.addChild(tailLine)
        scene?.addChild(tailBall)
    }
    
    // MARK: - UPDATE
    func update() {
        guard let scene = scene as? GameScene else { return }
        let leadingTeleBar = scene.leadingTeleBar
        
        drawTailNode()
        
        // Updating the ball color:
        if abs(movement.dy) > defaultMovement.dy || abs(movement.dx) > defaultMovement.dx {
            isMovingMad = true
        } else {
            isMovingMad = false
        }
        
        // Updating the ball's position:
        position.x += movement.dx
        position.y += movement.dy
        
        // Checking collisions against the tele bars:
        // Leading
        if (position.x <= leadingTeleBar.position.x + leadingTeleBar.frame.width / 2 + size.width / 2) && (position.y <= leadingTeleBar.position.y + leadingTeleBar.frame.height / 2 + size.height / 2) && (position.y >= leadingTeleBar.position.y - leadingTeleBar.frame.height / 2 - size.height / 2) {
            position.x = scene.trailingTeleBar.position.x
        }
        
        // Keeping the ball in bounds:
        guard let scene = scene as? GameScene else { return }
        
        if position.x < 0 && position.y > scene.player.position.y + scene.player.size.height / 2 {
            position.x = size.width / 2 + 15
            movement.dx = abs(movement.dx)
        }
        
        if position.x > scene.size.width && position.y > scene.player.position.y + scene.player.size.height / 2 {
            position.x = scene.size.width - size.width / 2 - 15
            movement.dx = abs(movement.dx) * -1
        }
        
        if position.y > scene.size.height {
            position.y = scene.size.height - size.height / 2 - 15
            movement.dy = abs(movement.dy) * -1
        }
    }
}
