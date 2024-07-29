//
//  ContentView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 28/07/2024.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    private let scene = GameScene()
    
    var body: some View {
        GeometryReader { geo in
            SpriteView(scene: scene)
                .onAppear { scene.size = geo.size }
        }
        .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
    }
}

#Preview {
    ContentView()
        .background(.gameGray)
}
