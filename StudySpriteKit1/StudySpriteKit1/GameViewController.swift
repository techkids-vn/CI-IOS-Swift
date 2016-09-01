//
//  GameViewController.swift
//  StudySpriteKit1
//
//  Created by Apple on 8/26/16.
//  Copyright (c) 2016 TechKids. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1 Create GameScene & convert view to SKView
        let skView = view as! SKView
        
        //2 Show FPS and NodeCount
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        
        //3 Set ScaleMode & present Scence
        let scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .ResizeFill
        
        //4 Present Scene
        skView.presentScene(scene)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
