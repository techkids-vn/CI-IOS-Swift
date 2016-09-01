//
//  GameViewController.swift
//  CIWithSwift
//
//  Created by Apple on 9/1/16.
//  Copyright (c) 2016 TechKids. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        // 1 Cast view into SKView
        print("1")
        let skView = self.view as! SKView
        
        // 2 Create GameScene
        print("2")
        let gameScence = GameScene(size: skView.frame.size)
        
        // 3 Present sence
        print("3")
        skView.presentScene(gameScence)
        
        super.viewDidLoad()
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
