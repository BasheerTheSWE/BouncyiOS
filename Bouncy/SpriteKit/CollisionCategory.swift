//
//  CollisionCategory.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 30/07/2024.
//

import SpriteKit

enum CollisionCategory: UInt32 {
    case topBar  = 1 // 0x00000001 << 0
    case sideBar = 2 // 0x00000001 << 1
    case player  = 4 // 0x00000001 << 2
    case ball    = 8 // 0x00000001 << 3
}
