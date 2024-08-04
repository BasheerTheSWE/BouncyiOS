//
//  MainBoard.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 04/08/2024.
//

import SpriteKit

final class MainBoard: SKSpriteNode {
    
    // MARK: - INIT
    init() {
        super.init(texture: nil, color: .clear, size: .zero)
        
        let texture = makeTexture()
        self.texture = texture
        self.size = texture.size()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DESIGN
    private func makeTexture() -> SKTexture {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 120, height: 20))
        let image = renderer.image { context in
            context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
            context.cgContext.setLineWidth(0)
            context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 0, y: 0, width: 120, height: 20), cornerWidth: 4, cornerHeight: 4, transform: nil))
            context.cgContext.drawPath(using: .fillStroke)
        }
        
        return SKTexture(image: image)
    }
}
