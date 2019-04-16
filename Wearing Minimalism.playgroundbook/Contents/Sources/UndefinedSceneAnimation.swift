//
//  IndefinedSceneAnimation.swift
//  Book_Sources
//
//  Created by Alan Victor Paulino de Oliveira on 22/03/19.
//

import UIKit
import SpriteKit
import AVFoundation

class UndefinedSceneAnimation: SKScene {
    var background:SKSpriteNode!
    var alanClothing: SKSpriteNode!
    var ballon: SKSpriteNode!
    var text1:SKLabelNode!
    var text2:SKLabelNode!
    var text3: SKLabelNode!
    
    var synthentizer:AVSpeechSynthesizer!
    
    
    public override init(size: CGSize){
        super.init(size: size)
        background = SKSpriteNode(imageNamed: "backgroundClothes")
        self.background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.background.size = self.frame.size
        self.background.zPosition = 0
        self.addChild(self.background)
        
        alanClothing = SKSpriteNode(imageNamed: "alanUndefined1")
        alanClothing.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.alanClothing.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 80)
        self.alanClothing.zPosition = 1
        self.addChild(alanClothing)
        
        ballon = SKSpriteNode(imageNamed: "ballon2")
        self.ballon.position = CGPoint(x: self.frame.midX + 80, y: self.frame.midY + 250)
        self.ballon.zPosition = 2
        self.addChild(ballon)
        
        self.text1 = SKLabelNode()
        self.text1.fontColor = .black
        self.text1.position = CGPoint(x: 0, y:20)
        self.text1.fontSize = 20
        self.text1.fontName = "Futura Bold"
        ballon.addChild(text1)
        
        self.text2 = SKLabelNode()
        self.text2.fontColor = .black
        self.text2.position = CGPoint(x: 0, y:0)
        self.text2.fontSize = 20
        self.text2.fontName = "Futura Bold"
        ballon.addChild(text2)
        
        self.text3 = SKLabelNode()
        self.text3.fontColor = .black
        self.text3.position = CGPoint(x: 0, y:-20)
        self.text3.fontSize = 20
        self.text3.fontName = "Futura Bold"
        ballon.addChild(text3)
        
        animateAlan()
        
    }
    
    func animateAlan(){
        let change4 = SKAction.animate(with: [SKTexture.init(imageNamed: "alanUndefined2")], timePerFrame: 0.3)
        let change5 = SKAction.animate(with: [SKTexture.init(imageNamed: "alanUndefined1")], timePerFrame: 0.3)
        
        let animate = SKAction.sequence([change4,change5])
        
        self.alanClothing.run(SKAction.repeatForever(animate))
        
        self.showAlert(title: "Hi, my name is Alan, let's find out about minimalism together?")
        
        fillText1()
        let wait1 = SKAction.wait(forDuration: 2)
        self.run(wait1){
            self.fillText2()
            let wait2 = SKAction.wait(forDuration: 2)
            self.run(wait2){
                self.fillText3()
                let wait3 = SKAction.wait(forDuration: 2.8)
                self.run(wait3){
                    self.clearTexts()
                    self.showAlert(title: "Try to define my life")
                    self.fillText4()
                }
            }
        }
        
    }
    
    func fillText1(){
        self.text1.animate(newText: "Hi, my name is Alan", characterDelay: 0.2)
    }
    
    func fillText2(){
        self.text2.animate(newText: "let's find out about", characterDelay: 0.2)
    }
    func fillText3(){
        self.text3.animate(newText: "minimalism together?", characterDelay: 0.2)
    }
    
    func fillText4(){
        self.text2.animate(newText: "Try to define my life", characterDelay: 0.2)
    }
    
    func clearTexts(){
        text1.text = ""
        text2.text = ""
        text3.text = ""
    }
    
    func showAlert(title: String) {
        let speechStr = title
        let utterance = AVSpeechUtterance(string: speechStr)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-gb")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .gameChat, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            print(error.localizedDescription)
        }
        synthentizer = AVSpeechSynthesizer()
        synthentizer.speak(utterance)
    }
//    func bla(frame: CGRect) {
//        removeAllChildren()
//        background = SKSpriteNode(imageNamed: "backgroundClothes")
//        self.background.position = CGPoint(x: frame.midX, y: frame.midY)
//        self.background.size = frame.size
//        self.background.zPosition = 0
//        self.addChild(self.background)
//
//        alanClothing = SKSpriteNode(imageNamed: "alanClothing")
//        alanClothing.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        self.alanClothing.position = CGPoint(x: frame.midX, y: frame.midY - 80)
//        self.alanClothing.zPosition = 1
//        addChild(alanClothing)
//
//        shirt = SKSpriteNode(texture: SKTexture(image: ModelClothes.shared.shirts.first!))
//        shirt.position = CGPoint(x: frame.midX, y: frame.midY - 145)
//        shirt.zPosition = 2
//        shirt.isHidden = true
//        addChild(shirt)
//
//        trouser = SKSpriteNode(texture: SKTexture(image: ModelClothes.shared.trousers.first!))
//        trouser.position = CGPoint(x: frame.midX, y: frame.midY - 245)
//        trouser.zPosition = 2
//        trouser.isHidden = true
//        addChild(trouser)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
