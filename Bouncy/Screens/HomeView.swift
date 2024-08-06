//
//  HomeView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 05/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    lazy var reboundingBallImage = generateReboundingBallImage()
    
    func generateReboundingBallImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1024, height: 1024))
        let image = renderer.image { context in
            
            for i in 0...75 {
                let x: CGFloat = CGFloat(150 + i * 12)
                var y: CGFloat = CGFloat(150 - i * 8)
                
                let nextX: CGFloat = CGFloat(150 + (i + 1) * 12)
                var nextY: CGFloat = CGFloat(150 - (i + 1) * 8)
                
                if y < 0 {
                    y = abs(y)
                }
                
                if nextY < 0 {
                    nextY = abs(nextY)
                }
                
                let size = CGSize(width: 75 - i, height: 75 - i)
                
                context.cgContext.setFillColor(UIColor.gameSecondary.cgColor)
                context.cgContext.addEllipse(in: CGRect(origin: CGPoint(x: x, y: y), size: size))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setStrokeColor(UIColor.gameSecondary.cgColor)
                context.cgContext.setLineWidth(size.width)
                context.cgContext.move(to: CGPoint(x: x + size.width / 2, y: y + size.height / 2))
                context.cgContext.addLine(to: CGPoint(x: nextX + size.width / 2, y: nextY + size.height / 2))
                context.cgContext.drawPath(using: .stroke)
            }
            
            for i in 0...75 {
                let x: CGFloat = CGFloat(150 + i * 12)
                var y: CGFloat = CGFloat(150 - i * 8)
                
                let nextX: CGFloat = CGFloat(150 + (i + 1) * 12)
                var nextY: CGFloat = CGFloat(150 - (i + 1) * 8)
                
                if y < 0 {
                    y = abs(y)
                }
                
                if nextY < 0 {
                    nextY = abs(nextY)
                }
                
                let size = CGSize(width: 75 - i, height: 75 - i)
                
                context.cgContext.setFillColor(UIColor.white.cgColor)
                context.cgContext.addEllipse(in: CGRect(x: x + size.width / 4, y: y + size.height / 4, width: size.width / 2, height: size.height / 2))
                context.cgContext.drawPath(using: .fill)
                
                context.cgContext.setStrokeColor(UIColor.white.cgColor)
                context.cgContext.setLineWidth(size.width / 2)
                context.cgContext.move(to: CGPoint(x: x + size.width / 2, y: y + size.height / 2))
                context.cgContext.addLine(to: CGPoint(x: nextX + size.width / 2, y: nextY + size.height / 2))
                context.cgContext.drawPath(using: .stroke)
            }
        }
        
        return image
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.gameGray.gradient)
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Image(.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width - 32)
                        .padding(.top)
                    
                    let reboundingImage = generateReboundingBallImage()
                    Image(uiImage: reboundingImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width - 32)
                    
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
            
            VStack {
//                Text("Bouncy")
//                    .font(.custom("Impact", size: 90))
//                    .shadow(color: .gamePrimary, radius: 10)
                
                Spacer()
                
                HomeButton(title: "Play") {
                    print("Hello, World!")
                }
                
                HomeButton(title: "Boards") {
                    print("Hello, World!")
                }
                
                HomeButton(title: "Settings") {
                    print("Hello, World!")
                }
                
                Spacer()
                    .frame(height: 15)
            }
        }
    }
}

#Preview {
    HomeView()
}
