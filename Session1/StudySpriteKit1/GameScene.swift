//
//  GameScene.swift
//  StudySpriteKit1
//
//  Created by Apple on 8/26/16.
//  Copyright (c) 2016 TechKids. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var plane: SKSpriteNode!
    var bullets : [SKSpriteNode] = []
    var lastUpdateTime : CFTimeInterval = -1
    var dt : CFTimeInterval = 0
    var planeDestination : CGPoint?

    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background.png")
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        background.zPosition = -1
        
        plane = SKSpriteNode(imageNamed: "plane3.png")
        plane.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        plane.zPosition = 0
        
        addChild(background)
        addChild(plane)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            print("touchesBegan: \(touch.locationInNode(self))")
//        }
        
        if touches.count > 0 {
            let touch = touches.first!
            self.planeDestination = touch.locationInNode(self)
            
//            plane.position = position
        }
    }
    
    func movePlane() {
        if let destination = planeDestination {
            let velocity = CGPoint(x: (destination.x - plane.position.x)/2, y: (destination.y - plane.position.y)/2)
            moveSrpite(plane, velocity: velocity)
        }
        
    }
    
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
////        for touch in touches {
////            print("touchesMoved: \(touch.locationInNode(self))")
////        }
//        
//        
//        if touches.count > 0 {
//            let touch = touches.first!
//            let position = touch.locationInNode(self)
//            let velocity = CGPoint(x: (position.x - plane.position.x)/2, y: (position.y - plane.position.y)/2)
//            moveSrpite(plane, velocity: velocity)
//            //            plane.position = position
//        }
//        
//    
//    }
    
    override func update(currentTime: CFTimeInterval) {
        
        if lastUpdateTime == -1 {
            lastUpdateTime = currentTime
        }
        else {
            self.dt = currentTime - lastUpdateTime
            if dt > 1 {
                let bullet = SKSpriteNode(imageNamed: "bullet.png")
                bullet.position = CGPoint(x: plane.position.x, y: plane.position.y + plane.size.height / 2)
                addChild(bullet)
                bullets.append(bullet)
                lastUpdateTime = currentTime
            }
        }
        
        print(currentTime)
        
        self.movePlane()
        
//        bullets = bullets.filter {
//            bullet in
//            return bullet.position.y < self.view?.frame.size.height
//        }
        
        
        
        for (index, bullet) in bullets.enumerate() {
            if bullet.position.y > self.view?.frame.size.height {
                bullets.removeAtIndex(index)
                bullet.removeFromParent()
            }
        }
        
//        let obsoleteBullets = bullets.filter {
//            bullet in
//            return bullet.position.y > self.frame.size.height
//        }
//        
//        for obsoleteBullet in obsoleteBullets {
//            obsoleteBullet.removeFromParent()
//            bullets.removeAtIndex(bullets.indexOf(obsoleteBullet)!)
//        }
        
        
        for bullet in bullets {
            bullet.position = CGPoint(x: bullet.position.x, y: bullet.position.y + 20)
        }
    }
    
    func moveSrpite(sprite: SKSpriteNode, velocity: CGPoint) {
        //1 
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt), y:  velocity.y * CGFloat(dt))
        
        //2
        sprite.position = CGPoint (
            x: sprite.position.x + amountToMove.x,
            y: sprite.position.y + amountToMove.y
        )
    }
}
