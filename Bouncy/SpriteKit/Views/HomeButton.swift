//
//  HomeButton.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 05/08/2024.
//

import SwiftUI

struct HomeButton: View {
    
    var body: some View {
        Button {
            print("Play")
        } label: {
            ZStack {
                Path { path in
                    path.move(to: .zero)
                    path.addLine(to: CGPoint(x: 275, y: 0))
                    path.addLine(to: CGPoint(x: 280, y: 5))
                    path.addLine(to: CGPoint(x: 280, y: 45))
                    path.addLine(to: CGPoint(x: 275, y: 50))
                    path.addLine(to: CGPoint(x: 5, y: 50))
                    path.addLine(to: CGPoint(x: 0, y: 45))
                    path.closeSubpath()
                }
                .fill(.gamePrimary)
                .frame(width: 280, height: 50)
                .clipped()
                
                Path { path in
                    path.move(to: .zero)
                    path.addLine(to: CGPoint(x: 10, y: 0))
                    path.addLine(to: CGPoint(x: 15, y: 5))
                    path.addLine(to: CGPoint(x: 15, y: 45))
                    path.addLine(to: CGPoint(x: 20, y: 50))
                    path.addLine(to: CGPoint(x: 5, y: 50))
                    path.addLine(to: CGPoint(x: 0, y: 45))
                    path.closeSubpath()
                }
                .fill(.gameLightBlue)
                .frame(width: 280, height: 50)
                .clipped()
                
                Path { path in
                    path.move(to: CGPoint(x: 270, y: 0))
                    path.addLine(to: CGPoint(x: 275, y: 0))
                    path.addLine(to: CGPoint(x: 280, y: 5))
                    path.addLine(to: CGPoint(x: 280, y: 45))
                    path.addLine(to: CGPoint(x: 275, y: 50))
                    path.addLine(to: CGPoint(x: 270, y: 50))
                    path.addLine(to: CGPoint(x: 275, y: 45))
                    path.addLine(to: CGPoint(x: 275, y: 5))
                    path.closeSubpath()
                }
                .fill(.gameLightBlue)
                .frame(width: 280, height: 50)
                .clipped()
                
                Path { path in
                    path.move(to: CGPoint(x: 15, y: 0))
                    path.addLine(to: CGPoint(x: 20, y: 5))
                    path.addLine(to: CGPoint(x: 20, y: 45))
                    path.addLine(to: CGPoint(x: 25, y: 50))
                }
                .stroke(.gameLightBlue, style: .init(lineWidth: 1))
                .frame(width: 280, height: 50)
                .clipped()
                
                Path { path in
                    path.move(to: CGPoint(x: 20, y: 0))
                    path.addLine(to: CGPoint(x: 25, y: 5))
                    path.addLine(to: CGPoint(x: 25, y: 45))
                    path.addLine(to: CGPoint(x: 30, y: 50))
                }
                .stroke(.gameLightBlue, style: .init(lineWidth: 1))
                .frame(width: 280, height: 50)
                .clipped()
                
                Path { path in
                    path.move(to: CGPoint(x: 265, y: 0))
                    path.addLine(to: CGPoint(x: 270, y: 5))
                    path.addLine(to: CGPoint(x: 270, y: 45))
                    path.addLine(to: CGPoint(x: 265, y: 50))
                }
                .stroke(.gameLightBlue, style: .init(lineWidth: 1))
                .frame(width: 280, height: 50)
                .clipped()
                
                Text("Play")
                    .bold()
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    HomeButton()
}
