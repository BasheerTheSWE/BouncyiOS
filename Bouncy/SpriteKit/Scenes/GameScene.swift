//
//  GameScene.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 28/07/2024.
//

import SpriteKit

final class GameScene: SKScene {
    
    let player = SKShapeNode(rectOf: CGSize(width: 120, height: 20))
    
    override func didMove(to view: SKView) {
        backgroundColor = .gray
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        player.fillColor = .red
        player.position = CGPoint(x: 100, y: 100)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.frame.size)
        player.physicsBody?.isDynamic = false
        player.physicsBody?.allowsRotation = false
        
        addChild(player)
        
        // Top Bar
        let topBar = SKShapeNode(rectOf: CGSize(width: size.width, height: 10))
        topBar.lineWidth = 0
        topBar.fillColor = .cyan
        topBar.position = CGPoint(x: size.width / 2, y: size.height - 5)
        topBar.physicsBody = SKPhysicsBody(rectangleOf: topBar.frame.size)
        topBar.physicsBody?.isDynamic = false
        topBar.physicsBody?.allowsRotation = false
        
        addChild(topBar)
        
        // Leading Bar
        let leadingBar = SKShapeNode(rectOf: CGSize(width: 10, height: size.height))
        leadingBar.lineWidth = 0
        leadingBar.fillColor = .cyan
        leadingBar.position = CGPoint(x: 5, y: size.height / 2 - 5)
        leadingBar.physicsBody = SKPhysicsBody(rectangleOf: leadingBar.frame.size)
        leadingBar.physicsBody?.isDynamic = false
        leadingBar.physicsBody?.allowsRotation = false
        
        addChild(leadingBar)
        
        // Trailing Bar
        let trailingBar = SKShapeNode(rectOf: CGSize(width: 10, height: size.height))
        trailingBar.lineWidth = 0
        trailingBar.fillColor = .cyan
        trailingBar.position = CGPoint(x: size.width - 5, y: size.height / 2 - 5)
        trailingBar.physicsBody = SKPhysicsBody(rectangleOf: trailingBar.frame.size)
        trailingBar.physicsBody?.isDynamic = false
        trailingBar.physicsBody?.allowsRotation = false
        
        addChild(trailingBar)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let node = SKShapeNode(circleOfRadius: 20)
        node.fillColor = .red
        node.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        node.physicsBody?.restitution = 1
        node.position = location
        
        addChild(node)
    }
}
