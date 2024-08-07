//
//  BouncyApp.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 28/07/2024.
//

import SwiftUI

@main
struct BouncyApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

/*
 Game Ideas:
    * The Kobe bar will have a bounce ability, when activated the ball won't bounce back once it hits the bar instead it will go up and down back to the bar and follow it right and left, then when the player lift their finger off the screen the ball will move.
    * Each board's ability can be activated by pulling down.
 
 TODO:
    * Progressive game difficulty.
    * Game over view.
    * Coins system.
 */
