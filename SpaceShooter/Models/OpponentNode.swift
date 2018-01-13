//
//  OpponentNode.swift
//  SpaceShooter
//
//  Created by Robert Ogiba on 13.01.2018.
//  Copyright © 2018 Robert Ogiba. All rights reserved.
//

import SpriteKit

class OpponentNode: GenericNode {
    var size: CGSize = CGSize.zero
    
    init(size:CGSize) {
        super.init()
        
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func collision(withPlayer player: SKNode) -> Bool {
        guard let _ = player.physicsBody else {
            return false
        }
        
        return true
    }
}
