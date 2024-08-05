//
//  MovingBar.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 01/08/2024.
//

import SpriteKit

final class MovingBar: SKShapeNode {
    
    enum BarType { case sideBar, topBar }
    
    var movementSpeed: CGFloat =  2
    let barType: BarType
    let size: CGSize
    
    // MARK: - INIT
    init(type barType: BarType, length: CGFloat) {
        let width: CGFloat = barType == .sideBar ? 12 : length
        let height: CGFloat = barType == .sideBar ? length : 12
        
        self.barType = barType
        self.size = CGSize(width: width, height: height)
        super.init()
        
        let path = CGPath(rect: CGRect(origin: CGPoint(x: -size.width / 2, y: -size.height / 2), size: size), transform: nil)
        self.path = path
        
        zPosition = ZPosition.backgroundActiveElement.rawValue
        setShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DESIGN
    private func setShape() {
        lineWidth = 0
        fillColor = .gameLightBlue
    }
    
    // MARK: - UPDATE
    func update() {
        guard let scene = scene as? GameScene else { return }
        
        switch barType {
        case .sideBar:
            position.y += movementSpeed
            
            if (position.y <= scene.sceneMargin.bottom + size.height / 2) || (position.y >= scene.size.height - size.height / 2) {
                movementSpeed *= -1
            }
            break
            
        case .topBar:
            position.x += movementSpeed
            
            if (position.x <= size.width / 2) || (position.x >= scene.size.width - size.width / 2) {
                movementSpeed *= -1
            }
            break
        }
    }
}
