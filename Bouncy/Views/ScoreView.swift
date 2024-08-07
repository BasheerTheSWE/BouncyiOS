//
//  ScoreView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 07/08/2024.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    
    var body: some View {
        Text("\(score)")
            .font(.custom("Impact", size: 12))
            .bold()
            .foregroundStyle(.white)
            .animation(.interactiveSpring)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(.gamePrimary.opacity(0.15))
            .clipShape(.capsule)
    }
}

#Preview {
    ScoreView(score: 10)
}
