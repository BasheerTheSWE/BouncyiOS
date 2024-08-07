//
//  GameOverView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 07/08/2024.
//

import SwiftUI

struct GameOverView: View {
    
    var body: some View {
        VStack {
            Text("Game Over")
                .font(.custom("Impact", size: 40))
                .foregroundStyle(.white)
                .padding()
                .shadow(color: .gamePrimary, radius: 0, x: 2, y: 2)
            
            Spacer()
            
            HStack {
                Button {
                    print("Tapped")
                } label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .tint(.white)
                        .frame(width: 50, height: 50)
                        .background(.gamePrimary.gradient)
                        .clipShape(.circle)
                }
                
                Button {
                    print("Tapped")
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
        .shadow(color: .gamePrimary, radius: 12)
    }
}

#Preview {
    GameOverView()
}
