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
    //var bullets : [SKSpriteNode] = []
    //var enemies : [SKSpriteNode] = []
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
        
        let fireAction = SKAction.runBlock {
            let bullet = SKSpriteNode(imageNamed: "bullet.png")
            bullet.position = CGPoint(x: self.plane.position.x, y: self.plane.position.y + self.plane.size.height / 2)
            bullet.name = "bullet"
            
            let bulletFlyUp = SKAction.repeatActionForever(
                SKAction.sequence([ SKAction.waitForDuration(0.017), SKAction.runBlock {
                    bullet.position.y += 10
                    }])
                )
            bullet.runAction(bulletFlyUp)
            self.addChild(bullet)
        }
        
        let fireActionWithDelay = SKAction.sequence([SKAction.waitForDuration(1),  fireAction])
        plane.runAction(SKAction.repeatActionForever(fireActionWithDelay))
        
        let spawnEnemy = SKAction.runBlock {
            for i in 0..<3 {
                let enemy = SKSpriteNode(imageNamed: "plane1.png")
                enemy.name = "enemy"
                let planeWidth = enemy.size.width
                enemy.position = CGPoint(x: planeWidth / 2 + CGFloat(i) * planeWidth , y: self.size.height - enemy.size.height / 2)
                let enemyFly = SKAction.moveTo(
                    CGPoint(x: enemy.position.x, y: -enemy.size.height), duration: 3)
                enemy.runAction(enemyFly)
                self.addChild(enemy)
            }
            
        }
        
        let spawnEnemyInTurn = SKAction.sequence([spawnEnemy, SKAction.waitForDuration(1)])
        
        addChild(background)
        addChild(plane)
        
        runAction(SKAction.repeatActionForever(spawnEnemyInTurn))
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        if let touch = touches.first {
            self.planeDestination = touch.locationInNode(self)
            movePlane()
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.count > 0 {
            let touch = touches.first!
            self.planeDestination = touch.locationInNode(self)
            movePlane()
        }
    }
    
    let velocity = 500.0
    
    func movePlane() {
        // MARK: optional here
        if let destination = planeDestination {
            let distance = destination.distanceFrom(plane.position)
            let moveAction = SKAction.moveTo(destination, duration: Double(distance)/velocity)
            plane.runAction(moveAction)
        }
    }
    
    
    var count = 0
    override func update(currentTime: CFTimeInterval) {
        
        if lastUpdateTime == -1 {
            lastUpdateTime = currentTime
        }
        else {
            self.dt = currentTime - lastUpdateTime
            if dt > 1 {
//                let bullet = SKSpriteNode(imageNamed: "bullet.png")
//                bullet.position = CGPoint(x: plane.position.x, y: plane.position.y + plane.size.height / 2)
//                bullet.name = "bullet"
//                addChild(bullet)
//                bullets.append(bullet)
                lastUpdateTime = currentTime
                count += 1
            }
            
//            if count > 2 {
//                for enemyIdx in 0..<3 {
//                    let enemy = SKSpriteNode(imageNamed: "plane1.png")
//                    enemy.position = CGPoint(x: CGFloat(enemyIdx * 70), y: self.frame.size.height - enemy.frame.size.height/2)
//                    enemy.name = "enemy"
//                    self.enemies.append(enemy)
//                    self.addChild(enemy)
//                }
//                count = 0
//            }
        }
        
//        print(currentTime)
        
        //self.movePlane()
//        
//        for (_, bullet) in bullets.enumerate() {
//            if bullet.position.y > self.view?.frame.size.height {
//                //bullets.removeAtIndex(index)
//                bullet.removeFromParent()
//            }
//        }
        
//        for (_, enemy) in enemies.enumerate() {
//            enemy.position.y -= 5
//            //enemy.name = "enemy"
//        }
        
        
//        for bullet in bullets {
//            bullet.position = CGPoint(x: bullet.position.x, y: bullet.position.y + 20)
//        }
    }
    
    override func didEvaluateActions() {
        enumerateChildNodesWithName("bullet", usingBlock:
            { bullet, _ in
                if bullet.position.y > self.size.height {
                    bullet.removeFromParent()
                } else {
                    self.enumerateChildNodesWithName("enemy", usingBlock:
                        { enemy, _ in
                            if enemy.position.y < 0 {
                                enemy.removeFromParent()
                            }
                            else if CGRectIntersectsRect(bullet.frame, enemy.frame) {
                                bullet.removeFromParent()
                                enemy.removeFromParent()
                                
                                let emitterNode = SKEmitterNode(fileNamed: "ExplosionParticle.sks")
                                emitterNode?.position = enemy.position
                                self.addChild(emitterNode!)
                                self.runAction(SKAction.waitForDuration(0.5), completion: {
                                    emitterNode?.removeFromParent()
                                })
                            }
                    })
                }
                
        })
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
