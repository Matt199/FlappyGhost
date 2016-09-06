//
//  GameScene.swift
//  Flappy Ghost
//
//  Created by Matt on 06.09.2016.
//  Copyright (c) 2016 Matt. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var ground = SKSpriteNode()
    var ghost = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        ground = SKSpriteNode(imageNamed: "Ground")
        ground.setScale(0.5)
        ground.position = CGPoint(x: self.frame.width/2, y: 0+ground.frame.height/2)
        
        ghost = SKSpriteNode(imageNamed: "Ghost")
        ghost.size = CGSize(width: 60, height: 70)
        ghost.position = CGPoint(x: self.frame.width/2 - ghost.frame.width/2, y: self.frame.height/2)
        
        
        self.addChild(ghost)
        self.addChild(ground)
        
        createWalls()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
       
        
    }
    
    
    func createWalls(){
    
        let addWall = SKNode()
        
        let topWall = SKSpriteNode(imageNamed: "Wall")
        let btmWall = SKSpriteNode(imageNamed: "Wall")
        
        
        topWall.setScale(0.5)
        btmWall.setScale(0.5)
        
        topWall.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2+350)
        btmWall.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2-350)

        addWall.addChild(topWall)
        addWall.addChild(btmWall)
        
        topWall.zRotation = CGFloat(M_PI)
        
        self.addChild(addWall)
        
        
        
    
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
