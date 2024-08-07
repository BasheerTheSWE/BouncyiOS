//
//  GameOverView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 07/08/2024.
//

import SwiftUI

struct GameOverView: View {
    
    let score: Int
    let onTappingReturn: (() -> ())?
    let onTappingPlay: (() -> ())?
    
    var body: some View {
        VStack {
            Text("Game Over")
                .font(.custom("Impact", size: 40))
                .foregroundStyle(.white)
                .padding()
                .shadow(color: .gamePrimary, radius: 0, x: 2, y: 2)
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("Score")
                    .font(.custom("Impact", size: 14))
                
                
                Text("\(score)")
                    .font(.custom("Impact", size: 32))
                    .foregroundStyle(.gameSecondary.gradient)
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "dollarsign.circle.fill")
                    .foregroundStyle(.yellow)
                    .font(.title)
                
                Text("\(score / 150)")
                    .font(.custom("Impact", size: 24))
            }
            .frame(maxWidth: 250, maxHeight: 75)
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 12))
            .shadow(color: .black, radius: 5)
            
            Spacer()
            
            HStack {
                Button {
                    onTappingReturn?()
                } label: {
                    Image(systemName: "house.fill")
                        .tint(.white)
                        .frame(width: 50, height: 50)
                        .background(.gamePrimary.gradient)
                        .clipShape(.circle)
                }
                
                Button {
                    onTappingPlay?()
                } label: {
                    Text("Play Again")
                        .font(.custom("Impact", size: 18))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundStyle(.white)
                        .background(.gamePrimary.gradient)
                        .clipShape(.capsule)
                }
            }
            .padding()
        }
        .frame(width: 280, height: 400)
        .background(.gameGray.gradient)
        .clipShape(.rect(cornerRadius: 12))
        .clipped()
        .shadow(color: .gamePrimary, radius: 5)
    }
}

#Preview {
    GameOverView(score: 3410, onTappingReturn: nil, onTappingPlay: nil)
}
