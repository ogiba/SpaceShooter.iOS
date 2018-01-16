//
//  Int+Extension.swift
//  SpaceShooter
//
//  Created by Robert Ogiba on 16.01.2018.
//  Copyright © 2018 Robert Ogiba. All rights reserved.
//

import Foundation

extension Int {
    func random(from min: Int) -> Int {
        return Int(arc4random_uniform(UInt32(self - min)))
    }
}
