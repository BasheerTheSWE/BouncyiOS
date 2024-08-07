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
            GeometryReader { geo in
                SpriteView(scene: scene)
                    .onAppear { scene.size = geo.size }
            }
            .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
            
            VStack {
                Spacer()
                    .frame(height: scene.sceneMargin.top + 25)
                
                ScoreView(score: scene.score)
                
                Spacer()
            }
            
            if scene.isGameOver {
                // Present the game over view
            }
        }
        .background(.gameGray)
        .onChange(of: scene.isGameOver) { _, _ in
            isPresented = false
        }
    }
}

#Preview {
    GameView(isPresented: .constant(true))
}
