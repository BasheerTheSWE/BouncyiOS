//
//  Ball.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 29/07/2024.
//

import SpriteKit

final class Ball: SKNode {
    
    // The `shadowPosition` is used to store the previous location of the ball for the tail drawing.
    private var shadowPosition: CGPoint = .zero
    
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
        drawHeadNode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DESIGN
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
        let tailLineEndingPoint = shadowPosition
        
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
        // Updating the ball's position:
        shadowPosition = position
        position.x += movement.dx
        position.y += movement.dy
        
        // Collisions:
        applyPlayerCollisions()
        applyTeleBarsCollisions()
        applyMovingBarsCollisions()
        applyWallCollisions()
        
        // Drawing the tail
        drawTailNode()
        
        // Updating the ball color:
        if abs(movement.dy) > defaultMovement.dy || abs(movement.dx) > defaultMovement.dx {
            isMovingMad = true
        } else {
            isMovingMad = false
        }
    }
    
    // MARK: - COLLISIONS
    private func applyPlayerCollisions() {
        guard let player = (scene as? GameScene)?.player else { return }
        
        if (position.x >= player.position.x - player.size.width / 2 - size.width / 2) && (position.x <= player.position.x + player.size.width / 2 + size.width / 2) && (position.y >= player.position.y - player.size.height / 2 - size.height / 2) && (position.y <= player.position.y + player.size.height / 2 + size.height / 2) && movement.dy < 0 {
            movement.dy = abs(defaultMovement.dy)
            movement.dx = abs(movement.dx) / movement.dx * defaultMovement.dx
        }
    }
    
    private func applyTeleBarsCollisions() {
        guard let scene = scene as? GameScene else { return }
        let leadingTeleBar = scene.leadingTeleBar
        let trailingTeleBar = scene.trailingTeleBar
        
        // Leading
        if (position.x <= leadingTeleBar.position.x + leadingTeleBar.frame.width / 2) && (position.y <= leadingTeleBar.position.y + leadingTeleBar.frame.height / 2 + size.height / 2) && (position.y >= leadingTeleBar.position.y - leadingTeleBar.frame.height / 2 - size.height / 2) && (movement.dx < 0) {
            position.x = trailingTeleBar.position.x - trailingTeleBar.frame.width / 2
            position.y -= movement.dy // Canceling the default y movement to make the teleportation appear as a straight line.
        }
        
        // Trailing
        if (position.x >= trailingTeleBar.position.x - trailingTeleBar.frame.width / 2) && (position.y <= trailingTeleBar.position.y + trailingTeleBar.frame.height / 2 + size.height / 2) && (position.y >= trailingTeleBar.position.y - trailingTeleBar.frame.height / 2 - size.height / 2) && (movement.dx > 0) {
            position.x = leadingTeleBar.position.x + leadingTeleBar.frame.width / 2
            position.y -= movement.dy // Canceling the default y movement to make the teleportation appear as a straight line.
        }
    }
    
    private func applyMovingBarsCollisions() {
        guard let scene = scene as? GameScene else { return }
        let topMovingBar = scene.topMovingBar
        let leadingMovingBar = scene.leadingMovingBar
        let trailingMovingBar = scene.trailingMovingBar
        
        // Top bar
        if (position.y >= topMovingBar.position.y - topMovingBar.size.height / 2 - size.height / 2) && (position.x <= topMovingBar.position.x + topMovingBar.size.width / 2 + size.width / 2) && (position.x >= topMovingBar.position.x - topMovingBar.size.width / 2 - size.width / 2) && (movement.dy > 0) {
            movement.dy = abs(movement.dy) * -1
            movement.dx *= -1
            
            movement.dx += abs(movement.dx) / movement.dx * movementIncreaseRate
        }
        
        // Leading
        if (position.x <= leadingMovingBar.position.x + leadingMovingBar.size.width / 2 + size.width / 2) && (position.y <= leadingMovingBar.position.y + leadingMovingBar.size.height / 2 + size.height / 2) && (position.y >= leadingMovingBar.position.y - leadingMovingBar.size.height / 2 - size.height / 2) && (movement.dx < 0) {
            movement.dy *= -1
            movement.dx = abs(movement.dx)
            
            movement.dy += abs(movement.dy) / movement.dy * movementIncreaseRate
        }
        
        // Trailing
        if (position.x >= trailingMovingBar.position.x - trailingMovingBar.size.width / 2 - size.width / 2) && (position.y <= trailingMovingBar.position.y + trailingMovingBar.size.height / 2 + size.height / 2) && (position.y >= trailingMovingBar.position.y - trailingMovingBar.size.height / 2 - size.height / 2) && (movement.dx > 0) {
            movement.dy *= -1
            movement.dx = abs(movement.dx) * -1
            
            movement.dy += abs(movement.dy) / movement.dy * movementIncreaseRate
        }
    }
    
    private func applyWallCollisions() {
        guard let scene = scene as? GameScene else { return }
        let player = scene.player
        
        // Top collisions
        if position.y >= scene.size.height - scene.sceneMargin - size.height / 2 && movement.dy > 0{
            position.y = scene.size.height - scene.sceneMargin - size.height / 2
            movement.dy = abs(movement.dy) * -1
        }
        
        // Side collisions
        if position.y >= player.position.y + player.size.height / 2 {
            if position.x <= scene.sceneMargin + size.width / 2 && movement.dx < 0 {
                // Leading
                position.x = scene.sceneMargin + size.width / 2
                movement.dx = abs(movement.dx)
            } else if position.x >= scene.size.width - scene.sceneMargin - size.width / 2 && movement.dx > 0 {
                // Trailing
                position.x = scene.size.width - scene.sceneMargin - size.width / 2
                movement.dx = abs(movement.dx) * -1
            }
        }
    }
}
