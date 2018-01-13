//
//  CollisionBitMask.swift
//  SpaceShooter
//
//  Created by Robert Ogiba on 13.01.2018.
//  Copyright © 2018 Robert Ogiba. All rights reserved.
//

import Foundation

struct CollisionBitMask {
    static let player: UInt32 = 0x00
    static let projectile: UInt32 = 0x01
    static let enemy: UInt32 = 0x02
}
