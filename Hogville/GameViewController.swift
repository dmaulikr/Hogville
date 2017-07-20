//
//  GameViewController.swift
//  Hogville
//
//  Created by Jean-Pierre Distler on 23.08.14.
//  Copyright (c) 2014 Jean-Pierre Distler. All rights reserved.
//

import UIKit
import SpriteKit



class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let scene = GameScene(size: view.frame.size) as GameScene? {
      // Configure the view.
      let skView = self.view as! SKView
      skView.showsFPS = true
      skView.showsNodeCount = true
      skView.showsPhysics = true
      /* Sprite Kit applies additional optimizations to improve rendering performance */
      skView.ignoresSiblingOrder = false
      
      /* Set the scale mode to scale to fit the window */
      scene.scaleMode = .aspectFill
      
      skView.presentScene(scene)
    }
  }
  
  override var shouldAutorotate : Bool {
    return true
  }
  

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  override var prefersStatusBarHidden : Bool {
    return true
  }
}
