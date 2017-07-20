//
//  GameScene.swift
//  Hogville
//
//  Created by Jean-Pierre Distler on 23.08.14.
//  Copyright (c) 2014 Jean-Pierre Distler. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  var movingPig: Pig?
  var lastUpdateTime: TimeInterval = 0.0
  var dt: TimeInterval = 0.0
  
  override init(size: CGSize) {
    super.init(size: size)
    
    let bg = SKSpriteNode(imageNamed: "bg_2_grassy")
    bg.anchorPoint = CGPoint(x: 0, y: 0)
    
    addChild(bg)
    
    let pig = Pig(imageNamed: "pig_1")
    pig.position = CGPoint(x: size.width / 2, y: size.height / 2)
    addChild(pig)
    pig.name = "pig"
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    /* Called when a touch begins */
    var touch = touches.first!.location(in: self)
    let node = atPoint(touch)
    
    if node.name == "pig" {
      let pig = node as! Pig
      pig.addMovingPoint(point: touch)
      movingPig = pig
    }
    
    
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    var touch : UITouch!
    touch = touches.first
    let touchLocation = touch.location(in: scene!)
    if let pig = movingPig {
      pig.addMovingPoint(point: touchLocation)
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     movingPig = nil
  }
  override func update(_ currentTime: TimeInterval) {
    /* Called before each frame is rendered */
    
    dt = currentTime - lastUpdateTime
    lastUpdateTime = currentTime
    
    enumerateChildNodes(withName: "pig", using: {node, stop in
      let pig = node as! Pig
      pig.move(dt: self.dt)
    })
    
    drawLines()

  }
  
  func drawLines() {
    //1
    enumerateChildNodes(withName: "line", using: {node, stop in
      node.removeFromParent()
    })
    
    //2
    enumerateChildNodes(withName: "pig", using: {node, stop in
      //3
      let pig = node as! Pig
      if let path = pig.createPathToMove() {
        let shapeNode = SKShapeNode()
        shapeNode.path = path
        shapeNode.name = "line"
        shapeNode.strokeColor = UIColor.gray
        shapeNode.lineWidth = 2
        shapeNode.zPosition = 1
        
        self.addChild(shapeNode)
      }
    })
  }
  
}
