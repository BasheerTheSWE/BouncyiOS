//
//  GameScene.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 28/07/2024.
//

import SpriteKit

final class GameScene: SKScene {
    
    let player = Player(size: CGSize(width: 120, height: 20))
    let ball = Ball(size: CGSize(width: 20, height: 20))
    
    override func didMove(to view: SKView) {
        backgroundColor = .gameGray
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        player.position = CGPoint(x: frame.size.width / 2, y: 100)
        addChild(player)
        
        ball.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(ball)
        
        // Top Bar
        let topBar = SKShapeNode(rectOf: CGSize(width: size.width, height: 10))
        topBar.lineWidth = 0
        topBar.fillColor = .gamePurple
        topBar.position = CGPoint(x: size.width / 2, y: size.height - 5)
        topBar.physicsBody = SKPhysicsBody(rectangleOf: topBar.frame.size)
        topBar.physicsBody?.isDynamic = false
        topBar.physicsBody?.allowsRotation = false
        
        addChild(topBar)
        
        // Leading Bar
        let leadingBar = SKShapeNode(rectOf: CGSize(width: 10, height: size.height - (player.position.y + player.size.height)))
        leadingBar.lineWidth = 0
        leadingBar.fillColor = .gamePurple
        leadingBar.position = CGPoint(x: 5, y: (size.height + (player.position.y + player.size.height)) / 2 - 5)
        leadingBar.physicsBody = SKPhysicsBody(rectangleOf: leadingBar.frame.size)
        leadingBar.physicsBody?.isDynamic = false
        leadingBar.physicsBody?.allowsRotation = false
        
        addChild(leadingBar)
        
        // Trailing Bar
        let trailingBar = SKShapeNode(rectOf: CGSize(width: 10, height: size.height - (player.position.y + player.size.height)))
        trailingBar.lineWidth = 0
        trailingBar.fillColor = .gamePurple
        trailingBar.position = CGPoint(x: size.width - 5, y: (size.height + (player.position.y + player.size.height)) / 2 - 5)
        trailingBar.physicsBody = SKPhysicsBody(rectangleOf: trailingBar.frame.size)
        trailingBar.physicsBody?.isDynamic = false
        trailingBar.physicsBody?.allowsRotation = false
        
        addChild(trailingBar)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        player.changePosition(towards: location)
        
//        let node = SKShapeNode(circleOfRadius: 20)
//        node.fillColor = .red
//        node.physicsBody = SKPhysicsBody(circleOfRadius: 20)
//        node.physicsBody?.restitution = 1
//        node.position = location
//        
//        addChild(node)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        player.changePosition(towards: location)
    }
}
