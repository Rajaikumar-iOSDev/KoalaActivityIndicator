//
//  KoalaScene.swift
//  Koala-ActivityIndicator
//
//  Created by Rajai kumar on 26/01/21.
//

import SpriteKit

class KoalaScene: SKScene {
    
    
    //Override Init function
    override init(size: CGSize) {
        
        
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func koalaAnimations() {
        
        let koala = SKSpriteNode(texture: SKTexture(image:SPMImage(named: "koala_walk1")!))
        koala.position = CGPoint(x: 0, y: 70)
        addChild(koala)
        var koalaTextures:[SKTexture] = []
        
        for i in 1...4 {
            koalaTextures.append(SKTexture(image:SPMImage(named: "koala_walk\(i)")!))
        }
        let koalaWalkAnimation = SKAction.animate(with: koalaTextures,
                                                  timePerFrame: 0.1)
        koala.removeAction(forKey: "animation")
        koala.run(SKAction.repeatForever(koalaWalkAnimation), withKey: "animation")
        let movePlayerAction = SKAction.moveTo(x: size.width, duration: 5.0)
        let actionRemove = SKAction.removeFromParent()
        let sequenceAction = SKAction.sequence([movePlayerAction,actionRemove])
        let repeatSequence = SKAction.repeatForever(sequenceAction)
        koala.run(repeatSequence)
    }
    
    override func didMove(to view: SKView) {
        run(SKAction.repeatForever(
                SKAction.sequence([SKAction.run(koalaAnimations),
                                   SKAction.wait(forDuration: 1.0)])))
        
    }
    
}

public func SPMImage(named name: String) -> UIImage? {
  UIImage(named: name, in: Bundle.module, compatibleWith: nil)
}

