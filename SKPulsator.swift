//
//  SKPulsator.swift
//  PulseAnimation
//
//  Created by Coder ACJHP on 17.09.2018.
//  Copyright © 2018 Coder ACJHP. All rights reserved.
//
import SpriteKit

extension SKSpriteNode {
    
    static var timer: Timer!
    static var circleRadius: CGFloat!
    private static let fillColor = UIColor.black.withAlphaComponent(0.20)
    
    func addPulseEffect(circleOfRadius: CGFloat, backgroundColor: UIColor = fillColor) {
        SKSpriteNode.circleRadius = circleOfRadius
        let circle = SKShapeNode(circleOfRadius: circleOfRadius)
        circle.fillColor = backgroundColor
        circle.lineWidth = 0.0
        circle.position = CGPoint(x: 0, y: 0)
        circle.zPosition = -1
        self.addChild(circle)
        let scale = SKAction.scale(to: 3.0, duration: 1.0)
        let fadeOut = SKAction.fadeOut(withDuration: 1.0)
        let clear = SKAction.run {
            circle.removeAllActions()
            circle.removeFromParent()
        }
        let pulseGroup = SKAction.sequence([scale, fadeOut, clear])
        let repeatSequence = SKAction.repeatForever(pulseGroup)
        circle.run(repeatSequence)
        
    }
    
    func repeatPulseEffectForEver(circleOfRadius: CGFloat) {
        if #available(iOS 10.0, *) {
            SKSpriteNode.timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { (timer) in
                self.addPulseEffect(circleOfRadius: circleOfRadius)
            }
        } else {
            SKSpriteNode.timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(SKSpriteNode.timerHandler), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc private func timerHandler() {
        self.addPulseEffect(circleOfRadius: SKSpriteNode.circleRadius)
    }
    
    public func stopAnimation() {
        if SKSpriteNode.timer.isValid {
            SKSpriteNode.timer.invalidate()
        }
    }
}
