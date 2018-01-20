//
//  GameElements.swift
//  SpaceShooter
//
//  Created by Robert Ogiba on 13.01.2018.
//  Copyright © 2018 Robert Ogiba. All rights reserved.
//

import SpriteKit

extension GameScene {
    func createMidground() -> SKNode {
        let midgroundNode = SKNode()
        return midgroundNode
    }
    
    func createPlayer() -> Player {
        let playerNode = Player()
        playerNode.position = CGPoint(x: self.size.width / 2.0, y: 100)
        return playerNode
    }
}
