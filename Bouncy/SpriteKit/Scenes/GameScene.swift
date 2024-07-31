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
    
    // MARK: - DID MOVE
    override func didMove(to view: SKView) {
        backgroundColor = .gameGray
        physicsWorld.contactDelegate = self
        
        player.position = CGPoint(x: frame.size.width / 2, y: 100)
        addChild(player)
        
        ball.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(ball)
        
        // Top Bar
        addBar(size: CGSize(width: size.width, height: 10),
               position: CGPoint(x: size.width / 2, y: size.height - 5),
               categoryBitMask: .topBar)
        
        // Leading Bar
        addBar(size: CGSize(width: 10, height: size.height - (player.position.y + player.size.height)),
               position: CGPoint(x: 5, y: (size.height + (player.position.y + player.size.height)) / 2 - 5),
               categoryBitMask: .sideBar)
        
        // Trailing Bar
        addBar(size: CGSize(width: 10, height: size.height - (player.position.y + player.size.height)),
               position: CGPoint(x: size.width - 5, y: (size.height + (player.position.y + player.size.height)) / 2 - 5),
               categoryBitMask: .sideBar)
    }
    
    // MARK: - TOUCHES
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        player.changePosition(towards: location)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        player.changePosition(towards: location)
    }
    
    // MARK: - NODES
    private func addBar(size: CGSize, position: CGPoint, categoryBitMask: CollisionCategory) {
        let bar = SKShapeNode(rectOf: size)
        bar.zPosition = ZPosition.background.rawValue
        bar.lineWidth = 0
        bar.fillColor = .gamePurple
        bar.position = position
        bar.physicsBody = SKPhysicsBody(rectangleOf: bar.frame.size)
        bar.physicsBody?.categoryBitMask = categoryBitMask.rawValue
        bar.physicsBody?.isDynamic = false
        bar.physicsBody?.allowsRotation = false
        
        addChild(bar)
    }
    
    // MARK: - UPDATE
    override func update(_ currentTime: TimeInterval) {
        ball.update()
        
        // Game Over:
        if ball.position.y < -50 {
            ball.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        }
    }
}


// MARK: - CONTACT DELEGATE
extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let CBMA = contact.bodyA.node?.physicsBody?.categoryBitMask,
              let CBMB = contact.bodyB.node?.physicsBody?.categoryBitMask else { return }
        
        let collision = CBMA | CBMB
        
        switch collision {
        case CollisionCategory.ball.rawValue | CollisionCategory.player.rawValue:
            ball.movement.dy *= -1
            break
            
        case CollisionCategory.ball.rawValue | CollisionCategory.topBar.rawValue:
            ball.movement.dy *= -1
            break
            
        case CollisionCategory.ball.rawValue | CollisionCategory.sideBar.rawValue:
            ball.movement.dx *= -1
            break
            
        default:
            break
        }
    }
}
