//
//  HomeView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 05/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            HomeBackgroundView()
            
            VStack {
                Spacer()
                
                HomeButton(title: "Play") {
                    print("Play")
                }
                
                HomeButton(title: "Boards") {
                    print("Boards")
                }
                
                HomeButton(title: "Settings") {
                    print("Settings")
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
