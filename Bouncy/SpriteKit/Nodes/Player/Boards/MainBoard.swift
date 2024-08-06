//
//  MainBoard.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 04/08/2024.
//

import SpriteKit

final class MainBoard: SKSpriteNode {
    
    var level = 10 {
        didSet {
            self.texture = makeTexture()
        }
    }
    
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
                
                let path = CGMutablePath()
                path.move(to: CGPoint(x: size.width / 2 - 20, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 20, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 15, y: size.height / 2 + 8))
                path.addLine(to: CGPoint(x: size.width / 2 - 15, y: size.height / 2 + 8))
                path.closeSubpath()
                
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path)
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: size.height / 2 - 2, width: size.width - 4, height: 4), cornerWidth: 2, cornerHeight: 2, transform: nil))
                context.cgContext.drawPath(using: .fill)
                break
                
            case 5:
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: 0, width: size.width - 4, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: 0, width: size.width - 8, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: size.height / 2 - 4, width: size.width - 8, height: 8), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                let path = CGMutablePath()
                path.move(to: CGPoint(x: size.width / 2 - 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 30, y: size.height / 2 + 8))
                path.addLine(to: CGPoint(x: size.width / 2 - 30, y: size.height / 2 + 8))
                path.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path)
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: size.height / 2 - 1, width: size.width - 12, height: 2), cornerWidth: 1, cornerHeight: 1, transform: nil))
                context.cgContext.drawPath(using: .fill)
                break
                
            case 6:
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: 0, width: size.width - 4, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: 0, width: size.width - 8, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: size.height / 2 - 4, width: size.width - 8, height: 8), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                let path = CGMutablePath()
                path.move(to: CGPoint(x: size.width / 2 - 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 30, y: size.height / 2 + 8))
                path.addLine(to: CGPoint(x: size.width / 2 - 30, y: size.height / 2 + 8))
                path.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path)
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: size.height / 2 - 1, width: size.width - 12, height: 2), cornerWidth: 1, cornerHeight: 1, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                let path2 = CGMutablePath()
                path2.move(to: CGPoint(x: size.width / 2 - 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 15, y: size.height / 2 + 7))
                path2.addLine(to: CGPoint(x: size.width / 2 - 15, y: size.height / 2 + 7))
                path2.closeSubpath()
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(path2)
                context.cgContext.drawPath(using: .fill)
                
                let path3 = CGMutablePath()
                path3.move(to: CGPoint(x: size.width / 2 - 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 7))
                path3.addLine(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 7))
                path3.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path3)
                context.cgContext.drawPath(using: .fill)
                
                let path4 = CGMutablePath()
                path4.move(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2, y: size.height / 2 + 7))
                path4.closeSubpath()
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(path4)
                context.cgContext.drawPath(using: .fill)
                break
                
            case 7:
                // Outer shell
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // First black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: 0, width: size.width - 4, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // First black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: 0, width: size.width - 8, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Second black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: 0, width: size.width - 12, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Second black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 8, y: 0, width: size.width - 16, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Third black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 12, y: 0, width: size.width - 24, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Third black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 14, y: 0, width: size.width - 28, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fourth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 20, y: 0, width: size.width - 40, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fourth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 22, y: 0, width: size.width - 44, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fifth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 30, y: 0, width: size.width - 60, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fifth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 32, y: 0, width: size.width - 64, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Sixth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 42, y: 0, width: size.width - 84, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Sixth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 44, y: 0, width: size.width - 88, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Midd-long-horizontal black line
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: size.height / 2 - 4, width: size.width - 8, height: 8), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Lower black trapezoid
                let path = CGMutablePath()
                path.move(to: CGPoint(x: size.width / 2 - 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 30, y: size.height / 2 + 8))
                path.addLine(to: CGPoint(x: size.width / 2 - 30, y: size.height / 2 + 8))
                path.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path)
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: size.height / 2 - 1, width: size.width - 12, height: 2), cornerWidth: 1, cornerHeight: 1, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Lower purple trapezoid
                let path2 = CGMutablePath()
                path2.move(to: CGPoint(x: size.width / 2 - 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 15, y: size.height / 2 + 7))
                path2.addLine(to: CGPoint(x: size.width / 2 - 15, y: size.height / 2 + 7))
                path2.closeSubpath()
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(path2)
                context.cgContext.drawPath(using: .fill)
                
                // Lower inner black trapezoid
                let path3 = CGMutablePath()
                path3.move(to: CGPoint(x: size.width / 2 - 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 7))
                path3.addLine(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 7))
                path3.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path3)
                context.cgContext.drawPath(using: .fill)
                
                // Lower inner cyan trapezoid
                let path4 = CGMutablePath()
                path4.move(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2, y: size.height / 2 + 7))
                path4.closeSubpath()
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(path4)
                context.cgContext.drawPath(using: .fill)
                break
                
            case 8:
                // Outer shell
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // First black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: 0, width: size.width - 4, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // First black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: 0, width: size.width - 8, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Second black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: 0, width: size.width - 12, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Second black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 8, y: 0, width: size.width - 16, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Third black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 12, y: 0, width: size.width - 24, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Third black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 14, y: 0, width: size.width - 28, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fourth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 20, y: 0, width: size.width - 40, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fourth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 22, y: 0, width: size.width - 44, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fifth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 30, y: 0, width: size.width - 60, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fifth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 32, y: 0, width: size.width - 64, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Sixth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 42, y: 0, width: size.width - 84, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Sixth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 44, y: 0, width: size.width - 88, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Midd-long-horizontal black line
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: size.height / 2 - 4, width: size.width - 8, height: 8), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Lower black trapezoid
                let path = CGMutablePath()
                path.move(to: CGPoint(x: size.width / 2 - 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 30, y: size.height / 2 + 8))
                path.addLine(to: CGPoint(x: size.width / 2 - 30, y: size.height / 2 + 8))
                path.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path)
                context.cgContext.drawPath(using: .fill)
                
                // Mid-long-horizontal purple line
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: size.height / 2 - 1, width: size.width - 12, height: 2), cornerWidth: 1, cornerHeight: 1, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Lower purple trapezoid
                let path2 = CGMutablePath()
                path2.move(to: CGPoint(x: size.width / 2 - 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 15, y: size.height / 2 + 7))
                path2.addLine(to: CGPoint(x: size.width / 2 - 15, y: size.height / 2 + 7))
                path2.closeSubpath()
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(path2)
                context.cgContext.drawPath(using: .fill)
                
                // Lower inner black trapezoid
                let path3 = CGMutablePath()
                path3.move(to: CGPoint(x: size.width / 2 - 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 7))
                path3.addLine(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 7))
                path3.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path3)
                context.cgContext.drawPath(using: .fill)
                
                // Lower inner cyan trapezoid
                let path4 = CGMutablePath()
                path4.move(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2, y: size.height / 2 + 7))
                path4.closeSubpath()
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(path4)
                context.cgContext.drawPath(using: .fill)
                break
                
            case 9:
                // Outer shell
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // First black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: 0, width: size.width - 4, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // First black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: 0, width: size.width - 8, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Second black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: 0, width: size.width - 12, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Second black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 8, y: 0, width: size.width - 16, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Third black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 12, y: 0, width: size.width - 24, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Third black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 14, y: 0, width: size.width - 28, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fourth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 20, y: 0, width: size.width - 40, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fourth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 22, y: 0, width: size.width - 44, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fifth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 30, y: 0, width: size.width - 60, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fifth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 32, y: 0, width: size.width - 64, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Sixth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 42, y: 0, width: size.width - 84, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Sixth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 44, y: 0, width: size.width - 88, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Midd-long-horizontal black line
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: size.height / 2 - 4, width: size.width - 8, height: 8), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Lower black trapezoid
                let path = CGMutablePath()
                path.move(to: CGPoint(x: size.width / 2 - 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 30, y: size.height / 2 + 8))
                path.addLine(to: CGPoint(x: size.width / 2 - 30, y: size.height / 2 + 8))
                path.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path)
                context.cgContext.drawPath(using: .fill)
                
                // Lower lines-trapezoids
                let lineTrapezoid = CGMutablePath()
                lineTrapezoid.move(to: CGPoint(x: size.width / 2 - 30, y: size.height / 2))
                lineTrapezoid.addLine(to: CGPoint(x: size.width / 2 + 30, y: size.height / 2))
                lineTrapezoid.addLine(to: CGPoint(x: size.width / 2 + 25, y: size.height / 2 + 5))
                lineTrapezoid.addLine(to: CGPoint(x: size.width / 2 - 25, y: size.height / 2 + 5))
                lineTrapezoid.closeSubpath()
                context.cgContext.setStrokeColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(lineTrapezoid)
                context.cgContext.drawPath(using: .stroke)
                
                // Mid-long-horizontal purple line
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: size.height / 2 - 1, width: size.width - 12, height: 2), cornerWidth: 1, cornerHeight: 1, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Lower purple trapezoid
                let path2 = CGMutablePath()
                path2.move(to: CGPoint(x: size.width / 2 - 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 15, y: size.height / 2 + 7))
                path2.addLine(to: CGPoint(x: size.width / 2 - 15, y: size.height / 2 + 7))
                path2.closeSubpath()
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(path2)
                context.cgContext.drawPath(using: .fill)
                
                // Lower inner black trapezoid
                let path3 = CGMutablePath()
                path3.move(to: CGPoint(x: size.width / 2 - 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 7))
                path3.addLine(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 7))
                path3.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path3)
                context.cgContext.drawPath(using: .fill)
                
                // Lower inner cyan trapezoid
                let path4 = CGMutablePath()
                path4.move(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2, y: size.height / 2 + 7))
                path4.closeSubpath()
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(path4)
                context.cgContext.drawPath(using: .fill)
                break
                
            case 10:
                // Outer shell
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(origin: .zero, size: size), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // First black arc
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 2, y: 0, width: size.width - 4, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // First black arc-end
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: 0, width: size.width - 8, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Second black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: 0, width: size.width - 12, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Second black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 8, y: 0, width: size.width - 16, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Third black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 12, y: 0, width: size.width - 24, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Third black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 14, y: 0, width: size.width - 28, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fourth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 20, y: 0, width: size.width - 40, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fourth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 22, y: 0, width: size.width - 44, height: size.height), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fifth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 30, y: 0, width: size.width - 60, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Fifth black arc-end
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 32, y: 0, width: size.width - 64, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Sixth black arc
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 42, y: 0, width: size.width - 84, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Sixth black arc-end
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 44, y: 0, width: size.width - 88, height: size.height / 2), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Midd-long-horizontal black line
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 4, y: size.height / 2 - 4, width: size.width - 8, height: 8), cornerWidth: 4, cornerHeight: 4, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Lower black trapezoid
                let path = CGMutablePath()
                path.move(to: CGPoint(x: size.width / 2 - 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 40, y: size.height / 2))
                path.addLine(to: CGPoint(x: size.width / 2 + 30, y: size.height / 2 + 8))
                path.addLine(to: CGPoint(x: size.width / 2 - 30, y: size.height / 2 + 8))
                path.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path)
                context.cgContext.drawPath(using: .fill)
                
                // Lower lines-trapezoids
                let lineTrapezoid = CGMutablePath()
                lineTrapezoid.move(to: CGPoint(x: size.width / 2 - 30, y: size.height / 2))
                lineTrapezoid.addLine(to: CGPoint(x: size.width / 2 + 30, y: size.height / 2))
                lineTrapezoid.addLine(to: CGPoint(x: size.width / 2 + 25, y: size.height / 2 + 5))
                lineTrapezoid.addLine(to: CGPoint(x: size.width / 2 - 25, y: size.height / 2 + 5))
                lineTrapezoid.closeSubpath()
                context.cgContext.setStrokeColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(lineTrapezoid)
                context.cgContext.drawPath(using: .stroke)
                
                // Mid-long-horizontal purple line
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(CGPath(roundedRect: CGRect(x: 6, y: size.height / 2 - 1, width: size.width - 12, height: 2), cornerWidth: 1, cornerHeight: 1, transform: nil))
                context.cgContext.drawPath(using: .fill)
                
                // Lower purple trapezoid
                let path2 = CGMutablePath()
                path2.move(to: CGPoint(x: size.width / 2 - 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 20, y: size.height / 2))
                path2.addLine(to: CGPoint(x: size.width / 2 + 15, y: size.height / 2 + 7))
                path2.addLine(to: CGPoint(x: size.width / 2 - 15, y: size.height / 2 + 7))
                path2.closeSubpath()
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addPath(path2)
                context.cgContext.drawPath(using: .fill)
                
                // Lower inner black trapezoid
                let path3 = CGMutablePath()
                path3.move(to: CGPoint(x: size.width / 2 - 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 10, y: size.height / 2))
                path3.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 7))
                path3.addLine(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 7))
                path3.closeSubpath()
                context.cgContext.setFillColor(UIColor.black.cgColor)
                context.cgContext.addPath(path3)
                context.cgContext.drawPath(using: .fill)
                
                // Lower inner cyan trapezoid
                let path4 = CGMutablePath()
                path4.move(to: CGPoint(x: size.width / 2 - 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 1))
                path4.addLine(to: CGPoint(x: size.width / 2, y: size.height / 2 + 7))
                path4.closeSubpath()
                context.cgContext.setFillColor(UIColor.gamePrimary.cgColor)
                context.cgContext.addPath(path4)
                context.cgContext.drawPath(using: .fill)
                break
                
            default:
                break
            }
        }
        
        return SKTexture(image: image)
    }
}
