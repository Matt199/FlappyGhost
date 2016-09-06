//
//  GameScene.swift
//  Flappy Ghost
//
//  Created by Matt on 06.09.2016.
//  Copyright (c) 2016 Matt. All rights reserved.
//

import SpriteKit





struct PhysicsCategory {
    static let Ghost : UInt32 = 0x1 << 1
    static let Ground : UInt32 = 0x1 << 2
    static let Wall : UInt32 = 0x1 << 3


}




class GameScene: SKScene {
    
    var ground = SKSpriteNode()
    var ghost = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        ground = SKSpriteNode(imageNamed: "Ground")
        ground.setScale(0.5)
        ground.position = CGPoint(x: self.frame.width/2, y: 0+ground.frame.height/2)
        
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: ground.size)
        ground.physicsBody?.categoryBitMask = PhysicsCategory.Ground
        ground.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
        ground.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
        
        ground.physicsBody?.affectedByGravity = false
        ground.physicsBody?.dynamic = false
        
        
        ghost = SKSpriteNode(imageNamed: "Ghost")
        ghost.size = CGSize(width: 60, height: 70)
        ghost.position = CGPoint(x: self.frame.width/2 - ghost.frame.width, y: self.frame.height/2)
        
        
        ghost.physicsBody = SKPhysicsBody(circleOfRadius: ghost.frame.width/2)
        ghost.physicsBody?.collisionBitMask = PhysicsCategory.Ground | PhysicsCategory.Wall
        ghost.physicsBody?.contactTestBitMask = PhysicsCategory.Ground | PhysicsCategory.Wall
        ghost.physicsBody?.affectedByGravity = true
        ghost.physicsBody?.dynamic = true
        
        
        
        self.addChild(ghost)
        self.addChild(ground)
        
        createWalls()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        ghost.physicsBody?.velocity = CGVectorMake(10, 0)
        ghost.physicsBody?.applyImpulse(CGVectorMake(0, 90))
       
        
    }
    
    
    func createWalls(){
    
        let addWall = SKNode()
        
        let topWall = SKSpriteNode(imageNamed: "Wall")
        let btmWall = SKSpriteNode(imageNamed: "Wall")
        
        
        topWall.setScale(0.5)
        btmWall.setScale(0.5)
        
        topWall.position = CGPoint(x: self.frame.width, y: self.frame.height/2+350)
        btmWall.position = CGPoint(x: self.frame.width, y: self.frame.height/2-350)

        topWall.physicsBody = SKPhysicsBody(rectangleOfSize: topWall.frame.size)
        btmWall.physicsBody = SKPhysicsBody(rectangleOfSize: btmWall.frame.size)
        
        
        topWall.physicsBody?.categoryBitMask = PhysicsCategory.Ground
        topWall.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
        topWall.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
        topWall.physicsBody?.affectedByGravity = false
        topWall.physicsBody?.dynamic = false
        
        
        btmWall.physicsBody?.categoryBitMask = PhysicsCategory.Ground
        btmWall.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
        btmWall.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
        btmWall.physicsBody?.affectedByGravity = false
        btmWall.physicsBody?.dynamic = false
        
        
        addWall.addChild(topWall)
        addWall.addChild(btmWall)
        
        topWall.zRotation = CGFloat(M_PI)
        btmWall.zPosition = 1
        self.addChild(addWall)
        
        
        
    
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
