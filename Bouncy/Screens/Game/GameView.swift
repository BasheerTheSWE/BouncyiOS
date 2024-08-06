//
//  GameView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 28/07/2024.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    private let viewModel = GameViewModel()
    
    @State private var scene: GameScene? = nil
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.gameGray
                .ignoresSafeArea()
            
            if let scene = scene {
                GeometryReader { geo in
                    SpriteView(scene: scene)
                        .onAppear {self.scene?.size = geo.size }
                }
                .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
            }
            
            if viewModel.isGameOver {
                // Present the game over view
            }
        }
        .onAppear {
            scene = GameScene()
            scene?.viewModel = viewModel
        }
    }
}

#Preview {
    GameView(isPresented: .constant(true))
}
