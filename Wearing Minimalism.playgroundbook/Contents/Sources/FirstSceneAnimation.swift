//
//  FirstSceneAnimation.swift
//  Book_Sources
//
//  Created by Alan Victor Paulino de Oliveira on 17/03/19.
//

import UIKit
import SpriteKit
import AVFoundation

class FirstSceneAnimation: SKScene {
    
    var background: SKSpriteNode!
    var littleMim: SKSpriteNode!
    var littleMimFrames:[SKTexture]!
    var cortina: SKSpriteNode!
    var washingMachine: SKSpriteNode!
    var washingMachineFrames:[SKTexture]!
    var ballon:SKSpriteNode!
    var armario:SKSpriteNode!
    var text1:SKLabelNode!
    var text2:SKLabelNode!
    var text3:SKLabelNode!
    var text4:SKLabelNode!

    var nameFont: String = "Futura Bold"
    
    var synthentizer:AVSpeechSynthesizer!
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func didMove(to view: SKView) {
        self.background = SKSpriteNode(imageNamed: "backgroundFirstScene")
        self.background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.background.size = self.frame.size
        self.background.zPosition = 0
        self.addChild(self.background)
        
        
        self.littleMimFrames = animatedFrames(withNameAtlas: "AlanSad", andBeginNameFiles: "alansad")
        self.littleMim = SKSpriteNode(imageNamed: "littleMimCry1")
        let proportionLittle = (littleMim.texture?.size().height)!/(littleMim.texture?.size().width)!
        self.littleMim.size = CGSize(width: self.size.width/7, height: self.size.width/7 * proportionLittle)
        self.littleMim.position = CGPoint(x: self.frame.midX - 0, y: self.frame.midY - 210)
        self.littleMim.setScale(1.3)
        self.littleMim.zPosition = 2
        self.littleMim.zRotation = -0.5
        self.addChild(littleMim)
        
        self.cortina = SKSpriteNode(imageNamed: "cortina")
        self.cortina.position = CGPoint(x: self.frame.midX - 100, y: self.frame.midY - 140)
        let proportionCortina = (cortina.texture?.size().height)!/(cortina.texture?.size().width)!
        self.cortina.size = CGSize(width: self.size.width/2.3, height: self.size.width/2.3 * proportionCortina)
        self.cortina.zPosition = 2
        self.addChild(cortina)
        
        self.washingMachineFrames = animatedFrames(withNameAtlas: "WashingMachine", andBeginNameFiles: "washing")
        let firstWashingFrame = washingMachineFrames[0]
        self.washingMachine = SKSpriteNode(texture: firstWashingFrame)
        self.washingMachine.position = CGPoint(x: self.frame.midX + 195, y: self.frame.midY - 160)
//        let proportionWashing = (washingMachine.texture?.size().height)!/(washingMachine.texture?.size().width)!
//        self.washingMachine.size = CGSize(width: self.size.width/4, height: self.size.width/4 * proportionWashing)
        self.washingMachine.setScale(1)
        self.washingMachine.zPosition = 2
        self.addChild(washingMachine)
        
//        self.armario = SKSpriteNode(imageNamed: "armario")
//        self.armario.position = CGPoint(x: self.frame.midX + 75, y: self.frame.midY - 50)
//        let proportionArmario = (armario.texture?.size().height)!/(armario.texture?.size().width)!
//        self.armario.size = CGSize(width: self.size.width/4, height: self.size.width/4 * proportionArmario)
//        self.armario.zPosition = 1
//        self.addChild(armario)
        
        self.ballon = SKSpriteNode(imageNamed: "ballon")
        self.ballon.position = CGPoint(x: self.frame.midX + 80, y: self.frame.midY - 60)
        let proportionBallon = (ballon.texture?.size().height)!/(ballon.texture?.size().width)!
        self.ballon.size = CGSize(width: self.size.width/4, height: self.size.width/4 * proportionBallon)
        self.ballon.zPosition = 2
        self.ballon.setScale(1.4)
        self.addChild(ballon)
        
        
        self.text1 = SKLabelNode()
        self.text1.fontColor = .black
        self.text1.position = CGPoint(x: 0, y: 18)
        self.text1.fontSize = 9
        self.text1.zPosition = 5
        self.text1.fontName = nameFont
        ballon.addChild(text1)
        
        self.text2 = SKLabelNode()
        self.text2.fontColor = .black
        self.text2.position = CGPoint(x: 0, y: 6)
        self.text2.fontSize = 9
        self.text2.zPosition = 5
        self.text2.fontName = nameFont
        ballon.addChild(text2)
        
        self.text3 = SKLabelNode()
        self.text3.fontColor = .black
        self.text3.position = CGPoint(x: 0,y: -6)
        self.text3.fontSize = 9
        self.text3.zPosition = 5
        self.text3.fontName = nameFont
        ballon.addChild(text3)
        
        self.text4 = SKLabelNode()
        self.text4.fontColor = .black
        self.text4.position = CGPoint(x: 0, y: -18)
        self.text4.fontSize = 9
        self.text4.zPosition = 5
        self.text4.fontName = nameFont
        ballon.addChild(text4)
        
        
        animateLittle()
        animateMachine()
    }
    
    public func animateMachine(){
        let rotateBy = SKAction.rotate(toAngle: 0.05, duration: 0.2)
        let rotateTo = SKAction.rotate(toAngle: -0.05, duration: 0.2)
        let rotate = SKAction.sequence([rotateBy,rotateTo])
        let clothingMove = SKAction.animate(with: washingMachineFrames, timePerFrame: 0.1, resize: false, restore: true)
        let animate = SKAction.group([clothingMove,rotate])
        let repeatForever = SKAction.repeatForever(animate)
        self.washingMachine.run(repeatForever)
    }
    
    public func animateLittle(){
        
        self.littleMimFrames.reverse()
        let talk = SKAction.animate(with: littleMimFrames, timePerFrame: 0.3, resize: false, restore: true)
        
        let repeatForever = SKAction.repeatForever(talk)
        
        self.littleMim.run(repeatForever)
        
        self.showAlert(title: "Oh my God! I might have to use the floor cleaning rags of my house as clothes.")
        
        fillText1()
        let wait1 = SKAction.wait(forDuration: 2)
        self.run(wait1){
            self.fillText2()
            let wait2 = SKAction.wait(forDuration: 2)
            self.run(wait2){
                self.fillText3()
                let wait3 = SKAction.wait(forDuration: 2)
                self.run(wait3){
                    self.fillText4()
                }
            }
        }
    }
    
    //MARK: Build Textures of animation
    
    func animatedFrames(withNameAtlas name:String, andBeginNameFiles file:String) -> [SKTexture]{
        let animatedAtlas = SKTextureAtlas(named: name)
        var movimentFrames:[SKTexture] = []
        
        let numImages = animatedAtlas.textureNames.count
        for i in 1...numImages{
            let textureName = "\(file)\(i)"
            movimentFrames.append(animatedAtlas.textureNamed(textureName))
        }
        return movimentFrames
    }
    
    
    func fillText1(){
        self.text1.animate(newText: "Oh my God! ", characterDelay: 0.2)
    }
    
    func fillText2(){
        self.text2.animate(newText: "I might have to use the ", characterDelay: 0.2)
    }
    
    func fillText3(){
        self.text3.animate(newText: "floor cleaning rags of", characterDelay: 0.2)
    }
    
    func fillText4(){
    self.text4.animate(newText: "my house as clothes", characterDelay: 0.2)
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


extension SKLabelNode {
    func animate(newText: String, characterDelay: TimeInterval) {
        
        DispatchQueue.main.async {
            
            self.text = ""
            
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay/2 * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }
}
