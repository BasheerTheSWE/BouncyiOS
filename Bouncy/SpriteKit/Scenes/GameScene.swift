//
//  GameScene.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 28/07/2024.
//

import SpriteKit

final class GameScene: SKScene {
    
    let sceneMargin: CGFloat = 10
    
    let player = Player(size: CGSize(width: 120, height: 20))
    let ball = Ball(size: CGSize(width: 20, height: 20))
    
    let topMovingBar = MovingBar(type: .topBar, length: 150)
    let leadingMovingBar = MovingBar(type: .sideBar, length: 200)
    let trailingMovingBar = MovingBar(type: .sideBar, length: 200)
    
    let leadingTeleBar = TeleBar(type: .leading)
    let trailingTeleBar = TeleBar(type: .trailing)
    
    // MARK: - DID MOVE
    override func didMove(to view: SKView) {
        backgroundColor = .gameGray
        
        player.position = CGPoint(x: frame.size.width / 2, y: 100)
        addChild(player)
        
        ball.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(ball)
        
        // Top Bar
        addBar(size: CGSize(width: size.width, height: sceneMargin),
               position: CGPoint(x: size.width / 2, y: size.height - sceneMargin / 2))
        
        // Leading Bar
        addBar(size: CGSize(width: sceneMargin, height: size.height - (player.position.y + player.size.height / 2)),
               position: CGPoint(x: sceneMargin / 2, y: (size.height + (player.position.y + player.size.height)) / 2 - 5))
        
        // Trailing Bar
        addBar(size: CGSize(width: sceneMargin, height: size.height - (player.position.y + player.size.height / 2)),
               position: CGPoint(x: size.width - sceneMargin / 2, y: (size.height + (player.position.y + player.size.height)) / 2 - 5))
        
        // Moving bars:
        topMovingBar.position = CGPoint(x: size.width / 2, y: size.height - topMovingBar.size.height / 2)
        leadingMovingBar.position = CGPoint(x: leadingMovingBar.size.width / 2, y: (size.height + player.position.y) / 2)
        trailingMovingBar.position = CGPoint(x: size.width - trailingMovingBar.size.width / 2, y: (size.height + player.position.y) / 2)
        
        // Teleportation bars:
        leadingTeleBar.position = CGPoint(x: sceneMargin + 15 + leadingTeleBar.frame.width / 2,
                                          y: (size.height + player.position.y + player.size.height) / 2)
        trailingTeleBar.position = CGPoint(x: size.width - sceneMargin - 15 - trailingTeleBar.frame.width / 2,
                                           y: (size.height + player.position.y + player.size.height) / 2)
        
        addChild(leadingTeleBar)
        addChild(trailingTeleBar)
        
        addChild(topMovingBar)
        addChild(leadingMovingBar)
        addChild(trailingMovingBar)
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
    private func addBar(size: CGSize, position: CGPoint) {
        let bar = SKShapeNode(rectOf: size)
        bar.zPosition = ZPosition.background.rawValue
        bar.lineWidth = 0
        bar.fillColor = .gamePurple
        bar.position = position
        
        addChild(bar)
    }
    
    // MARK: - UPDATE
    override func update(_ currentTime: TimeInterval) {
        ball.update()
        topMovingBar.update()
        leadingMovingBar.update()
        trailingMovingBar.update()
        leadingTeleBar.update()
        trailingTeleBar.update()
        
        // Game Over:
        if ball.position.y < -50 {
            ball.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        }
    }
}
