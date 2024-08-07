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
            Group {
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
            }
            .blur(radius: scene.isGameOver ? 10 : 0)
            
            if scene.isGameOver {
                GameOverView(score: scene.score) {
                    isPresented = false
                } onTappingPlay: {
                    scene.isGameOver = false
                    scene.score = 0
                    scene.addBall()
                }
            }
        }
        .defersSystemGestures(on: .bottom)
        .background(.gameGray)
    }
}

#Preview {
    GameView(isPresented: .constant(true))
}
