//
//  GameScene.swift
//  SpaceShooter
//
//  Created by Robert Ogiba on 13.01.2018.
//  Copyright © 2018 Robert Ogiba. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    public var scaleFactor: CGFloat?
    
    fileprivate var backgroud: SKNode?
    fileprivate var midground: SKNode?
    fileprivate var foreground: SKNode?
    fileprivate var player: SKNode?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size:size)
        
        scaleFactor = self.size.height / 320
        
        backgroundColor = SKColor.blue
        
        setupEnviroment()
        setupPlayer()
        
//        physicsWorld.gravity = CGVector(dx: 0, dy: -2)
        physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let _player = player else {
            return
        }
        
        var otherNode: SKNode?
        
        if contact.bodyA.node != _player {
            otherNode = contact.bodyA.node
        } else {
            otherNode = contact.bodyB.node
        }
        
        if let _collisioned = (otherNode as? OpponentNode)?.collision(withPlayer: _player), _collisioned {
            print("Collisioned with opponent")
        } else if let _collisioned = (otherNode as? GenericNode)?.collision(withPlayer: _player), _collisioned{
            print("Collisioned with generic node")
        } else {
            print("Not collision detected")
        }
    }
    
    override func didMove(to view: SKView) {
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {[weak self]() -> Void in
            guard
                let _player = self?.player,
                let _size = self?.size else {
                return
            }

            let translation = pos.x - _player.position.x

            if pos.x < _size.width, pos.x > 0 {
                _player.position.x += translation
            }
        })
    
    }
    
    func touchUp(atPoint pos : CGPoint) {
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func setupPlayer() {
        player = createPlayer()
        
        if let _player = player {
            foreground?.addChild(_player)
        }
    }
    
    func setupEnviroment() {
        midground = createMidground()
        
        if let _midground = midground {
            addChild(_midground)
        }
        
        foreground = SKNode()
        
        if let _foreground = foreground {
            addChild(_foreground)
        }
    }
}
