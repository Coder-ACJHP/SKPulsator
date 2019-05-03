# SKPulsator
<div>
  <h2>Circle pulse animation for SKSpriteNode as extension</h2>
  <br>
  <img src="https://github.com/Coder-ACJHP/SKPulsator/blob/master/Pulsator.gif" width=300 height=500>
  <br>
  <h2>How to use?</h2>
</div>
<ul>
  <li>Add <b>SKPulsator.swift</b> file to your project</li>
  <li>Call the <b>addPulseEffect()</b> function by adding <b>.</b> after your SKSpriteNode name</li>
</ul>
<h2>Example usage : </h2>
<pre>
<code>
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
</code>
</pre>

##### And <a href="https://gist.github.com/Coder-ACJHP/f77dd0b383b9797eff299336f4a5fc5f">here</a> is UIKit version (lightweight)

<p><b>License :</b> GNU GENERAL PUBLIC LICENSE V3</p>
