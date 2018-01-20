//
//  Player.swift
//  SpaceShooter
//
//  Created by Robert Ogiba on 20.01.2018.
//  Copyright © 2018 Robert Ogiba. All rights reserved.
//

import SpriteKit

class Player: SKNode {
    fileprivate var sprite: SKSpriteNode?
    
    public var spriteSize: CGSize = CGSize(width: 30.0, height: 30.0) {
        didSet {
            sprite?.size = CGSize(width: spriteSize.width, height: spriteSize.height / 10)
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
//        self.position = CGPoint(x: self.size.width / 2.0, y: 100)
        
        
        prepareSprite()
        preparePhysicsBody()
    }
    
    fileprivate func prepareSprite() {
        //        let sprite = SKSpriteNode(imageNamed: "player")
        sprite = SKSpriteNode(color: SKColor.red, size: spriteSize)
        
        if let _sprite = sprite {
            self.addChild(_sprite)
        }
    }
    
    fileprivate func preparePhysicsBody() {
        guard let _sprite = sprite else {
            return
        }
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: _sprite.size.width / 2.0)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        
        self.physicsBody?.restitution = 1
        self.physicsBody?.friction = 0
        self.physicsBody?.angularDamping = 0
        self.physicsBody?.linearDamping = 0
        
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        self.physicsBody?.categoryBitMask = CollisionBitMask.player
        
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = CollisionBitMask.projectile | CollisionBitMask.player
    }
}
