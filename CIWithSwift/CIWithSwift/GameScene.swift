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
    var planeDestination: CGPoint?
    var planeSpeed : CGFloat = 10
    var lastTimeUpdate : CFTimeInterval = -1
    
    override func didMoveToView(view: SKView) {
        print("Did move to view")
        addBackground()
        addPlane()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Move the plane to the touch position immediately
        if let touch = touches.first {
            planeDestination = touch.locationInNode(self)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Move the plane to the touch position immediately
        if let touch = touches.first {
            planeDestination = touch.locationInNode(self)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        if lastTimeUpdate == -1 {
            lastTimeUpdate = currentTime
        } else {
            let dt = currentTime - lastTimeUpdate
            print(dt * 1000)
            lastTimeUpdate = currentTime
        }

        //print("\(currentTime)")
        if let dest = planeDestination {
            let dx = dest.x - plane.position.x
            let dy = dest.y - plane.position.y
            let distance = sqrt(dx * dx + dy * dy)
            let amountToMove = distance / planeSpeed
        }
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
