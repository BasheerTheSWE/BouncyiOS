//
//  GameView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 28/07/2024.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    private let scene = GameScene()
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.gameGray
                .ignoresSafeArea()
            
            GeometryReader { geo in
                SpriteView(scene: scene)
                    .onAppear { scene.size = geo.size }
            }
            .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
            
            VStack {
                Spacer()
                    .frame(height: scene.sceneMargin.top + 25)
                Text("\(scene.score)")
                    .font(.custom("Impact", size: 12))
                    .bold()
                    .foregroundStyle(.white)
                    .animation(.interactiveSpring)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .background(.gamePrimary)
                    .clipShape(.capsule)
                    .opacity(0.25)
                
                Spacer()
            }
            
            if scene.isGameOver {
                // Present the game over view
            }
        }
    }
}

#Preview {
    GameView(isPresented: .constant(true))
}
