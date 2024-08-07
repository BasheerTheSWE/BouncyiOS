//
//  GameScene.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 28/07/2024.
//

import SpriteKit

@Observable final class GameScene: SKScene {
    
    var score = 0
    var isGameOver = false
    
    struct SceneMargin {
        let top: CGFloat = 10
        let leading: CGFloat = 10
        let trailing: CGFloat = 10
        let bottom: CGFloat = 100
    }
    
    let sceneMargin = SceneMargin()
    let maximumBallsCount = 10
    
    var balls: [Ball] = []
    let player = Player(size: CGSize(width: 120, height: 20))
    
    let leadingTeleBar = TeleBar(type: .leading)
    let trailingTeleBar = TeleBar(type: .trailing)
    
    let topMovingBar = MovingBar(type: .topBar, length: 150)
    let leadingMovingBar = MovingBar(type: .sideBar, length: 200)
    let trailingMovingBar = MovingBar(type: .sideBar, length: 200)
    
    // MARK: - DID MOVE
    override func didMove(to view: SKView) {
        backgroundColor = .gameGray
        
        player.position = CGPoint(x: frame.size.width / 2, y: sceneMargin.bottom - player.size.height / 2)
        addChild(player)
        
        addBall()
        
        // Top Bar
        addBar(size: CGSize(width: size.width, height: sceneMargin.top),
               position: CGPoint(x: size.width / 2, y: size.height - sceneMargin.top / 2))
        
        // Leading Bar
        addBar(size: CGSize(width: sceneMargin.leading, height: size.height - sceneMargin.bottom),
               position: CGPoint(x: sceneMargin.leading / 2, y: (size.height + sceneMargin.bottom) / 2))
        
        // Trailing Bar
        addBar(size: CGSize(width: sceneMargin.trailing, height: size.height - sceneMargin.bottom),
               position: CGPoint(x: size.width - sceneMargin.trailing / 2, y: (size.height + sceneMargin.bottom) / 2))
        
        // Moving bars:
        topMovingBar.position = CGPoint(x: size.width / 2, y: size.height - topMovingBar.size.height / 2)
        leadingMovingBar.position = CGPoint(x: leadingMovingBar.size.width / 2, y: (size.height + sceneMargin.bottom) / 2)
        trailingMovingBar.position = CGPoint(x: size.width - trailingMovingBar.size.width / 2, y: (size.height + sceneMargin.bottom) / 2)
        
        // Teleportation bars:
        leadingTeleBar.position = CGPoint(x: sceneMargin.leading + 15 + leadingTeleBar.frame.width / 2,
                                          y: (size.height + sceneMargin.bottom) / 2)
        trailingTeleBar.position = CGPoint(x: size.width - sceneMargin.trailing - 15 - trailingTeleBar.frame.width / 2,
                                           y: (size.height + sceneMargin.bottom) / 2)
        
        addChild(leadingTeleBar)
        addChild(trailingTeleBar)
        
        addChild(topMovingBar)
        addChild(leadingMovingBar)
        addChild(trailingMovingBar)
    }
    
    // MARK: - TOUCHES
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isGameOver else { return }
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        player.changePosition(towards: location)
        
        if player.board.level < 10 {
            player.board.level += 1
        } else {
            player.board.level = 1
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isGameOver else { return }
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        player.changePosition(towards: location)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isGameOver else { return }
        guard let _ = touches.first else { return }
        player.jump()
    }
    
    // MARK: - NODES
    func addBall(at position: CGPoint = .zero, direction: Ball.Direction = .random) {
        guard balls.count < maximumBallsCount else { return }
        
        let ball = Ball(direction: direction)
        ball.position = position != .zero ? position : CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        
        balls.append(ball)
        addChild(ball)
    }
    
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
        guard !isGameOver else { return }
        
        player.update()
        topMovingBar.update()
        leadingMovingBar.update()
        trailingMovingBar.update()
        leadingTeleBar.update()
        trailingTeleBar.update()
        
        balls.forEach { ball in
            ball.update()
            
            if ball.position.y < -50 {
                ball.removeFromParent()
                balls.removeAll { $0 == ball }
            }
        }
        
        if balls.isEmpty {
            // GameOver
            // To be changed later
            isGameOver = true
//            addBall(at: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2))
        }
    }
}
