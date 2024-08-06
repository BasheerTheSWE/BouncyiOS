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
            
            GeometryReader { geo in
                VStack {
                    Image(.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width - 32)
                        .padding(.top)
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        Image(.signature)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .offset(x: -10)
                            .opacity(1)
                        
                        Spacer()
                        
                        Image(.bottomRightFillerShape)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .opacity(0.75)
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
//                Text("Bouncy")
//                    .font(.custom("Impact", size: 90))
//                    .shadow(color: .gamePrimary, radius: 10)
                
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
