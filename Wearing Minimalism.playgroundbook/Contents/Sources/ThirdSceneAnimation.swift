//
//  ThirdSceneAnimation.swift
//  LiveViewTestApp
//
//  Created by Alan Victor Paulino de Oliveira on 20/03/19.
//

import UIKit
import SpriteKit
import AVFoundation

class ThirdSceneAnimation: SKScene {
    
    var background: SKSpriteNode!
    var littleMim:SKSpriteNode!
    var ballon:SKSpriteNode!
    var text1: SKLabelNode!
    var text2:SKLabelNode!
    var text3:SKLabelNode!
    var nameFont: String = "Futura Bold"
    
    var synthentizer:AVSpeechSynthesizer!
    
    public override init(size: CGSize){
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.background = SKSpriteNode(imageNamed: "backgroundThirdScene")
        self.background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.background.size = self.frame.size
        self.background.zPosition = 0
        self.addChild(self.background)
        
        self.littleMim = SKSpriteNode(imageNamed: "littleMimHappy1")
        self.littleMim.position = CGPoint(x: self.frame.midX - 10, y: self.frame.midY - 210)
        self.littleMim.setScale(1.3)
        self.littleMim.zPosition = 1
        self.addChild(littleMim)
        
        self.ballon = SKSpriteNode(imageNamed: "ballon")
        //        self.ballon.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.ballon.position = CGPoint(x: self.frame.midY, y: self.frame.midY)
        self.ballon.zPosition = 2
        self.ballon.setScale(1.4)
        self.addChild(ballon)
        
        self.text1 = SKLabelNode()
        self.text1.fontColor = .black
        self.text1.position = CGPoint(x: 0, y:15)
        self.text1.fontSize = 10
        self.text1.fontName = nameFont
        ballon.addChild(text1)
        
        self.text2 = SKLabelNode()
        self.text2.fontColor = .black
        self.text2.position = CGPoint(x: 0, y: 0)
        self.text2.fontSize = 10
        self.text2.zPosition = 5
        self.text2.fontName = nameFont
        ballon.addChild(text2)
        
        self.text3 = SKLabelNode()
        self.text3.fontColor = .black
        self.text3.position = CGPoint(x: 0, y: -15)
        self.text3.fontSize = 10
        self.text3.zPosition = 5
        self.text3.fontName = nameFont
        ballon.addChild(text3)
        
        animateLittle()
    }
    
    public func animateLittle(){
        let change4 = SKAction.animate(with: [SKTexture.init(imageNamed: "alansurprise1")], timePerFrame: 0.3)
        let change5 = SKAction.animate(with: [SKTexture.init(imageNamed: "alansurprise2")], timePerFrame: 0.3)
        
        
        let animate = SKAction.sequence([change4, change5])
        
        let repeatForever = SKAction.repeatForever(animate)
        
        self.littleMim.run(repeatForever)
        
        self.showAlert(title: "Oh my god! I have so many clothes it doesn't even fit in my wardrobe.")
        
        fillText1()
        let wait1 = SKAction.wait(forDuration: 3)
        self.run(wait1){
            self.fillText2()
            let wait2 = SKAction.wait(forDuration: 2)
            self.run(wait2){
                self.fillText3()
                let wait2 = SKAction.wait(forDuration: 3)
                self.run(wait2){
                    self.clearTexts()
                    
                    self.showAlert(title: "I can't even remember when I got that t-shirt")
                    self.fillText4()
                    let wait2 = SKAction.wait(forDuration: 1.4)
                    self.run(wait2){
                        self.fillText5()
                        let wait2 = SKAction.wait(forDuration: 1.4)
                        self.run(wait2){
                            self.fillText6()
                        }
                    }
                }
            }
        }
        
    }
    
    func fillText1(){
        self.text1.animate(newText: "Oh my god! I have so", characterDelay: 0.2)
    }
    
    func fillText2(){
        self.text2.animate(newText: "many clothes it doesn't even", characterDelay: 0.15)
    }
    
    func fillText3(){
        self.text3.animate(newText: "fit in my wardrobe", characterDelay: 0.15)
    }
    func fillText4(){
        self.text1.animate(newText: "I can't even", characterDelay: 0.15)
    }
    
    func fillText5(){
        self.text2.animate(newText: "remember when ", characterDelay: 0.15)
    }
    
    func fillText6(){
        self.text3.animate(newText: "I got that t-shirt", characterDelay: 0.15)
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
    
}