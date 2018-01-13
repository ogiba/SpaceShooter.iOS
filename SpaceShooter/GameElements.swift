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
    
    func createPlayer() -> SKNode {
        let playerNode = SKNode()
        playerNode.position = CGPoint(x: self.size.width / 2.0, y: 100)
        
//        let sprite = SKSpriteNode(imageNamed: "player")
        let sprite = SKSpriteNode(color: SKColor.red, size: CGSize(width: 300.0, height: 300.0))
        sprite.size = CGSize(width: sprite.size.width / 10, height: sprite.size.height / 10)
        playerNode.addChild(sprite)
        
        playerNode.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2.0)
        playerNode.physicsBody?.isDynamic = false
        playerNode.physicsBody?.allowsRotation = false

        playerNode.physicsBody?.restitution = 1
        playerNode.physicsBody?.friction = 0
        playerNode.physicsBody?.angularDamping = 0
        playerNode.physicsBody?.linearDamping = 0

        playerNode.physicsBody?.usesPreciseCollisionDetection = true

        playerNode.physicsBody?.categoryBitMask = CollisionBitMask.player

        playerNode.physicsBody?.collisionBitMask = 0
        playerNode.physicsBody?.contactTestBitMask = CollisionBitMask.projectile | CollisionBitMask.player
        
        return playerNode
    }
}
