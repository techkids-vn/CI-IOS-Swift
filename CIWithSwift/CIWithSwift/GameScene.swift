//
//  GameScene.swift
//  CIWithSwift
//
//  Created by Apple on 9/1/16.
//  Copyright (c) 2016 TechKids. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var plane : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        addBackground()
        addPlane()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Move the plane to the touch position immediately
        if let touch = touches.first {
            let touchPosition = touch.locationInNode(self)
            plane.position = touchPosition
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Move the plane to the touch position immediately
        if let touch = touches.first {
            let touchPosition = touch.locationInNode(self)
            plane.position = touchPosition
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    func addBackground() {
        let background = SKSpriteNode(imageNamed: "background.png")
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        addChild(background)
    }
    
    func addPlane() {
        plane = SKSpriteNode(imageNamed: "plane.png")
        plane.position = CGPoint(x: self.size.width / 2, y: plane.size.height / 2)
        addChild(plane)
    }
}
