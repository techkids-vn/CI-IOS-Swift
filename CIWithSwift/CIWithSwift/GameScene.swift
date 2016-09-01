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
    var planeSpeed : CGFloat = 50
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
            
            // Check if the screen was touched or moved
            if let dest = planeDestination {
                // yes, move the plane to the touched position
                
                // 1 Calculate distance between the plane and the destination
                let dx = dest.x - plane.position.x
                let dy = dest.y - plane.position.y
                let distance = sqrt(dx * dx + dy * dy)
                
                // 2. Calculate the ratio to know the amount to move in each coordinate
                let ratio = distance / planeSpeed
                // Check if the amount to move is smaller or larger than speed
                if ratio > 1 {
                    plane.position = plane.position.shift(dx / ratio, dy: dy / ratio)
                } else {
                    // The amount to move is smaller than speed, then move the plane to the destination and reset planeDestination
                    plane.position = dest
                    planeDestination = nil
                }
            }
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
