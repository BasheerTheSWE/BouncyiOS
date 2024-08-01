//
//  CollisionCategory.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 30/07/2024.
//

import SpriteKit

enum CollisionCategory: UInt32 {
    case topBar        = 1  // 0x00000001 << 0
    case sideBar       = 2  // 0x00000001 << 1
    case sideMovingBar = 4  // 0x00000001 << 2
    case topMovingBar  = 8  // 0x00000001 << 3
    case player        = 16 // 0x00000001 << 4
    case ball          = 32 // 0x00000001 << 5
}
