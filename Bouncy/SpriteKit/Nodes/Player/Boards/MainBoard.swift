//
//  MainBoard.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 04/08/2024.
//

import SpriteKit

final class MainBoard: SKSpriteNode {
    
    var level = 3
    
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
        let size = CGSize(width: 120, height: 20)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        let image = renderer.image { context in
            switch level {
            case 1:
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                break
                
            case 2:
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 0, y: size.height / 2 - 2, width: size.width, height: 4), cornerWidth: 2, cornerHeight: 2, transform: nil))
                context.cgContext.drawPath(using: .fill)
                break
                
            case 3:
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 0, y: size.height / 2 - 4, width: size.width, height: 8), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: size.height / 2 - 2, width: size.width - 4, height: 4), cornerWidth: 2, cornerHeight: 2, transform: nil))
                context.cgContext.drawPath(using: .fill)
                break
                
            case 4:
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 0, y: size.height / 2 - 4, width: size.width, height: 8), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: size.height / 2 - 2, width: size.width - 4, height: 4), cornerWidth: 2, cornerHeight: 2, transform: nil))
                context.cgContext.drawPath(using: .fill)
                break
                
            case 5:
                break
                
            case 6:
                break
                
            case 7:
                break
                
            case 8:
                break
                
            case 9:
                break
                
            case 10:
                break
                
            default:
                break
            }
        }
        
        return SKTexture(image: image)
    }
}
