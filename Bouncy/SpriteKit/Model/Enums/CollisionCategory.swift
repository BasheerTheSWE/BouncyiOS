//
//  CollisionCategory.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 30/07/2024.
//

import SpriteKit

enum CollisionCategory: UInt32 {
    case topBar        = 001 // 0x00000001 << 0
    case sideBar       = 002 // 0x00000001 << 1
    case sideMovingBar = 004 // 0x00000001 << 2
    case topMovingBar  = 008 // 0x00000001 << 3
    case teleBarL      = 016 // 0x00000001 << 4
    case teleBarT      = 032 // 0x00000001 << 5
    case player        = 064 // 0x00000001 << 6
    case ball          = 128 // 0x00000001 << 7
}
