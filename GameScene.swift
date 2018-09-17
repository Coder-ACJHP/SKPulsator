//
//  GameScene.swift
//  PulseAnimation
//
//  Created by Onur Işık on 17.09.2018.
//  Copyright © 2018 Onur Işık. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var pulseNode: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = .white
        if let node = self.childNode(withName: "anyNode") as? SKSpriteNode {
            self.pulseNode = node
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.pulseNode.repeatPulseEffectForEver(circleOfRadius: 80)
        
        //self.pulseNode.addPulseEffect(circleOfRadius: 80, backgroundColor: .red)

    }
}
