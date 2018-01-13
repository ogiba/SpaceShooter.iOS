//
//  GenericNode.swift
//  SpaceShooter
//
//  Created by Robert Ogiba on 13.01.2018.
//  Copyright © 2018 Robert Ogiba. All rights reserved.
//

import SpriteKit

class GenericNode: SKNode {
    func collision(withPlayer player: SKNode) -> Bool {
        return false
    }
    
    func shouldRemoveNode(playerX: CGFloat) {
        if playerX > self.position.x - 50 {
            self.removeFromParent()
        }
    }
}
