//
//  ClothingScene.swift
//  Book_Sources
//
//  Created by Alan Victor Paulino de Oliveira on 21/03/19.
//

import Foundation
import SpriteKit

class ClothingScene: SKScene {
    
    var background:SKSpriteNode!
    var alanClothing: SKSpriteNode!
    var shirt: SKSpriteNode!
    var trouser:SKSpriteNode!
    
    
    public override init(size: CGSize){
        super.init(size: size)
        background = SKSpriteNode(imageNamed: "backgroundClothes")
        self.background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.background.size = self.frame.size
        self.background.zPosition = 0
        self.addChild(self.background)
        
        alanClothing = SKSpriteNode(imageNamed: "alanClothing")
        alanClothing.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.alanClothing.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 80)
        self.alanClothing.zPosition = 1
        addChild(alanClothing)
        
        shirt = SKSpriteNode(texture: SKTexture(image: ModelClothes.shared.shirts.first!))
        shirt.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 145)
        shirt.zPosition = 2
        shirt.isHidden = true
        addChild(shirt)
        
        trouser = SKSpriteNode(texture: SKTexture(image: ModelClothes.shared.trousers.first!))
        trouser.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 245)
        trouser.zPosition = 2
        trouser.isHidden = true
        addChild(trouser)
    }
    
    func bla(frame: CGRect) {
        removeAllChildren()
        background = SKSpriteNode(imageNamed: "backgroundClothes")
        self.background.position = CGPoint(x: frame.midX, y: frame.midY)
        self.background.size = frame.size
        self.background.zPosition = 0
        self.addChild(self.background)
        
        alanClothing = SKSpriteNode(imageNamed: "alanClothing")
        alanClothing.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.alanClothing.position = CGPoint(x: frame.midX, y: frame.midY - 80)
        self.alanClothing.zPosition = 1
        addChild(alanClothing)
        
        shirt = SKSpriteNode(texture: SKTexture(image: ModelClothes.shared.shirts.first!))
        shirt.position = CGPoint(x: frame.midX, y: frame.midY - 145)
        shirt.zPosition = 2
        shirt.isHidden = true
        addChild(shirt)
        
        trouser = SKSpriteNode(texture: SKTexture(image: ModelClothes.shared.trousers.first!))
        trouser.position = CGPoint(x: frame.midX, y: frame.midY - 245)
        trouser.zPosition = 2
        trouser.isHidden = true
        addChild(trouser)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeShirt(image: UIImage){
        shirt.isHidden = false
        shirt.texture = SKTexture(image: image)
    }
    
    func changeTrouser(image: UIImage){
        trouser.isHidden = false
        trouser.texture = SKTexture(image: image)
    }
}

