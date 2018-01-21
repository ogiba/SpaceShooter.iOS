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
    fileprivate var player: Player?
    
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {[weak self]() -> Void in
            guard let _player = self?.player else {
                return
            }

            let newXPosition = _player.position.x + (pos.x - _player.position.x)
            let newYPosition = _player.position.y + (pos.y - _player.position.y)
            
            print("New position for ship: \(CGPoint(x: newXPosition,y: newYPosition))")
            
            _player.newPosition = CGPoint(x: newXPosition, y: newYPosition)
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
        
        if let _player = player,
            let _newPosition = _player.newPosition  {
            
            let playerSize = _player.size
            
            if _newPosition.y > playerSize.height, _newPosition.y < size.height * 3 / 4,
                _newPosition.x > playerSize.width , _newPosition.x < size.width - playerSize.width {
                player?.move()
            }
        }
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
