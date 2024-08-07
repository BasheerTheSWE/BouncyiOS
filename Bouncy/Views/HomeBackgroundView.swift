//
//  HomeBackgroundView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 06/08/2024.
//

import SwiftUI

struct HomeBackgroundView: View {
    
    @State private var reboundingBallImage: UIImage? = nil
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Image(.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width - 32)
                    .padding(.top)
                
                if let image = reboundingBallImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width - 32)
                }
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    Image(.signature)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .offset(x: -10)
                        .opacity(1)
                    
                    Spacer()
                    
                    Image(.bottomRightFillerShape)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.gameSubPrimary.gradient)
                        .frame(width: 150)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea(edges: .bottom)
        .background(.black.gradient)
        .onAppear { generateReboundingBallImage() }
    }
    
    func generateReboundingBallImage() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1024, height: 1024))
        reboundingBallImage = renderer.image { context in
            
            for i in 0...75 {
                let x = CGFloat(150 + i * 12)
                let y = abs(CGFloat(150 - i * 8))
                let nextX = CGFloat(150 + (i + 1) * 12)
                let nextY = abs(CGFloat(150 - (i + 1) * 8))
                let size = CGSize(width: 75 - i, height: 75 - i)
                
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addEllipse(in: CGRect(origin: CGPoint(x: x, y: y), size: size))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setStrokeColor(UIColor.gameSecondary.cgColor)
                context.cgContext.setLineWidth(size.width)
                context.cgContext.move(to: CGPoint(x: x + size.width / 2,
                                                   y: y + size.height / 2))
                context.cgContext.addLine(to: CGPoint(x: nextX + size.width / 2,
                                                      y: nextY + size.height / 2))
                context.cgContext.drawPath(using: .stroke)
            }
            
            for i in 0...75 {
                let x = CGFloat(150 + i * 12)
                let y = abs(CGFloat(150 - i * 8))
                let nextX = CGFloat(150 + (i + 1) * 12)
                let nextY = abs(CGFloat(150 - (i + 1) * 8))
                let size = CGSize(width: 75 - i, height: 75 - i)
                
                context.cgContext.setFillColor(UIColor.white.cgColor)
                context.cgContext.addEllipse(in: CGRect(x: x + size.width / 4,
                                                        y: y + size.height / 4,
                                                        width: size.width / 2,
                                                        height: size.height / 2))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setStrokeColor(UIColor.white.cgColor)
                context.cgContext.setLineWidth(size.width / 2)
                context.cgContext.move(to: CGPoint(x: x + size.width / 2,
                                                   y: y + size.height / 2))
                context.cgContext.addLine(to: CGPoint(x: nextX + size.width / 2,
                                                      y: nextY + size.height / 2))
                context.cgContext.drawPath(using: .stroke)
            }
        }
    }
}

#Preview {
    HomeBackgroundView()
}
