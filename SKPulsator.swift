//
//  Extension.swift
//  PulseAnimation
//
//  Created by Onur Işık on 17.09.2018.
//  Copyright © 2018 Onur Işık. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    
    private static let fillColor = UIColor(red: 0, green: 0.455, blue: 0.756, alpha: 0.45)
    
    func addPulseEffect(circleOfRadius: CGFloat, backgroundColor: UIColor = fillColor) {
        
        let circle = SKShapeNode(circleOfRadius: circleOfRadius)
        circle.fillColor = backgroundColor
        circle.lineWidth = 0.0
        circle.position = CGPoint(x: 0, y: 0)
        self.addChild(circle)
        let scale = SKAction.scale(to: 3.0, duration: 1.0)
        let fadeOut = SKAction.fadeOut(withDuration: 1.0)
        let pulseGroup = SKAction.sequence([scale, fadeOut])
        let repeatSequence = SKAction.repeatForever(pulseGroup)
        circle.run(repeatSequence)
        
    }
    
    func repeatPulseEffectForEver(circleOfRadius: CGFloat) {
        let _ = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { (timer) in
            self.addPulseEffect(circleOfRadius: circleOfRadius)
        }
        
    }
    
}
