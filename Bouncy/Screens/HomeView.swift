//
//  HomeView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 05/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color.gameGray
                .ignoresSafeArea()
            
            VStack {
//                Text("Bouncy")
//                    .font(.custom("Impact", size: 90))
//                    .shadow(color: .gamePrimary, radius: 10)
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 280, height: 150)
                
                Spacer()
                
                HomeButton(title: "Play") {
                    print("Hello, World!")
                }
                
                HomeButton(title: "Boards") {
                    print("Hello, World!")
                }
                
                HomeButton(title: "Settings") {
                    print("Hello, World!")
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
