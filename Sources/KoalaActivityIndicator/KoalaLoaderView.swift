//
//  KoalaLoaderView.swift
//  Koala-ActivityIndicator
//
//  Created by Rajai kumar on 27/01/21.
//

import Foundation
import UIKit
import SpriteKit
public class KoalaLoaderView:SKView{
    var koalaScene: SKScene?
    
public    func addKoalaAnimation()
    {
            koalaScene = KoalaScene(size: CGSize(width: self.bounds.width, height: self.bounds.height))
            self.ignoresSiblingOrder = true
            koalaScene?.scaleMode = .aspectFill
            koalaScene?.backgroundColor = .clear
            self.presentScene(koalaScene)
            self.backgroundColor  = .clear
    }

}
