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
                Spacer()
                
                HomeButton()
            }
        }
    }
}

#Preview {
    HomeView()
}
