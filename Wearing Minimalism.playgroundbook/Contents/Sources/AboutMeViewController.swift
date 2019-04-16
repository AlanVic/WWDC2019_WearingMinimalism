//
//  AboutMeViewController.swift
//  LiveViewTestApp
//
//  Created by Alan Victor Paulino de Oliveira on 23/03/19.
//

//import UIKit
//import SpriteKit
//
//class AboutMeViewController: UIViewController {
//
//    lazy var myImage:UIImageView = {
//        let imageview:UIImageView = UIImageView(frame: .zero)
//        imageview.translatesAutoresizingMaskIntoConstraints = false
//        imageview.image = UIImage(imageLiteralResourceName: "alanperfil1")
//        imageview.backgroundColor = .blue
//        imageview.clipsToBounds = true
//        imageview.contentMode = .scaleAspectFill
//        return imageview
//    }()
//
//    var skView:SKView = {
//        let newView = SKView(frame: .zero)
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        return newView
//    }()
//
//    var scene:ScenePerfil!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        self.view.addSubview(skView)
//        self.view.addSubview(myImage)
//
//
//
//        makeContraints()
//
////        scene = ScenePerfil(size: skView.frame.size)
////        scene.scaleMode = .resizeFill
////        skView.presentScene(scene, transition: SKTransition.fade(withDuration: 3))
//
//    }
//
//
//    override func viewDidLayoutSubviews() {
//        myImage.layer.cornerRadius = myImage.frame.height / 2
//
////        scene.bla(frame: self.view.frame)
//    }
//
//    func makeContraints(){
//        NSLayoutConstraint.activate([
//            myImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
//            myImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
//            myImage.heightAnchor.constraint(equalTo: myImage.widthAnchor),
//            myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//
////            skView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            skView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            skView.topAnchor.constraint(equalTo: view.topAnchor),
////            skView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ])
//    }
//}
//
//class ScenePerfil:SKScene{
//    var background:SKSpriteNode!
//    var image1:SKSpriteNode!
//    var image2:SKSpriteNode!
//    var image3:SKSpriteNode!
//    var image4:SKSpriteNode!
//
//    public override init(size: CGSize){
//        super.init(size: size)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    override func didMove(to view: SKView) {
//        background = SKSpriteNode(imageNamed: "backgroundClothes")
//        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        self.background.size = self.frame.size
//        self.background.zPosition = 0
//        addChild(background)
//
//        image1 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil2")))
//        image1.zPosition = 1
//        image2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil3")))
//        image2.zPosition = 1
//        image3 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil4")))
//        image3.zPosition = 1
//        image4 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil1")))
//        image3.zPosition = 1
//
//        addChild(image1)
//        addChild(image2)
//        addChild(image3)
//        addChild(image4)
//
//        self.animations(node: image1)
//        self.animations(node: image2)
//        self.animations(node: image3)
//        self.animations(node: image4)
//    }
//
//    func bla(frame: CGRect){
//        removeAllChildren()
//        background = SKSpriteNode(imageNamed: "backgroundClothes")
//        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        self.background.size = self.frame.size
//        self.background.zPosition = 0
//        addChild(background)
//
//        image1 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil2")))
//        image1.zPosition = 1
//        image2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil3")))
//        image2.zPosition = 1
//        image3 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil4")))
//        image3.zPosition = 1
//        image4 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil1")))
//        image3.zPosition = 1
//
//        background.addChild(image1)
//        background.addChild(image2)
//        background.addChild(image3)
//        background.addChild(image4)
//
//        self.animations(node: image1)
//        self.animations(node: image2)
//        self.animations(node: image3)
//        self.animations(node: image4)    }
//
//    private func animations(node: SKSpriteNode?){
//        var nodeCoyp = node
//        let scale = Float.random(in: 0.3...0.7)
//        nodeCoyp?.setScale(CGFloat(scale))
//        nodeCoyp?.position.y = -1.0 * (nodeCoyp?.frame.height ?? 0)
//
//        let x = Float.random(in: 0...200)
//        nodeCoyp?.position.x = CGFloat(x)
//
//        if scale <= 0.5 {
//            if scale >= 0.3 && scale < 0.4{
//                let duration = Float.random(in: 23...28)
//                nodeCoyp?.zPosition = 0
//                let action = SKAction.moveTo(y: view!.frame.height, duration: TimeInterval(duration))
//                nodeCoyp?.run(action ,completion: {
//                    nodeCoyp?.removeFromParent()
//                    nodeCoyp = nil
//                })
//            }else{
//                let duration = Float.random(in: 18...23)
//                nodeCoyp?.zPosition = 1
//                let action = SKAction.moveTo(y: view!.frame.height, duration: TimeInterval(duration))
//                nodeCoyp?.run(action ,completion: {
//                    nodeCoyp?.removeFromParent()
//                    nodeCoyp = nil
//                })
//            }
//        }else{
//            if scale >= 0.4 && scale <= 0.5{
//                let duration = Float.random(in: 8...13)
//                nodeCoyp?.zPosition = 2
//                let action = SKAction.moveTo(y: view!.frame.height, duration: TimeInterval(duration))
//                nodeCoyp?.run(action ,completion: {
//                    nodeCoyp?.removeFromParent()
//                    nodeCoyp = nil
//                })
//            }else{
//                let duration = Float.random(in: 13...18)
//                nodeCoyp?.zPosition = 3
//                let action = SKAction.moveTo(y: view!.frame.height, duration: TimeInterval(duration))
//                nodeCoyp?.run(action ,completion: {
//                    nodeCoyp?.removeFromParent()
//                    nodeCoyp = nil
//                })
//            }
//        }
//    }
//}

import UIKit
import SpriteKit

class AboutMeViewController: UIViewController {
    
    lazy var myImage:UIImageView = {
        let imageview:UIImageView = UIImageView(frame: .zero)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(imageLiteralResourceName: "alanperfil1")
        imageview.backgroundColor = .blue
        imageview.clipsToBounds = true
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    var skView:SKView = {
        let newView = SKView(frame: .zero)
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView
    }()
    
        var scene:ScenePerfil!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.view.addSubview(skView)
        
        let newSKView = SKView(frame: self.view.frame)
        newSKView.contentMode = .scaleToFill
        newSKView.showsFPS = true
        newSKView.showsNodeCount = true
        view = newSKView
        self.view.addSubview(myImage)
        
        scene = ScenePerfil(size: newSKView.frame.size)
        scene.scaleMode = .resizeFill
        newSKView.presentScene(scene, transition: SKTransition.fade(withDuration: 10))
        
        
        makeContraints()
    }
    
    override func viewDidLayoutSubviews() {
        myImage.layer.cornerRadius = myImage.frame.height / 2
        scene.bla(frame: self.view.frame)
    }
    
    func makeContraints(){
        NSLayoutConstraint.activate([
            myImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            myImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            myImage.heightAnchor.constraint(equalTo: myImage.widthAnchor),
            myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            //            skView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //            skView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //            skView.topAnchor.constraint(equalTo: view.topAnchor),
            //            skView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    
    class ScenePerfil:SKScene{
        var background:SKSpriteNode!
        var image1:SKSpriteNode!
        var image2:SKSpriteNode!
        var image3:SKSpriteNode!
        var image4:SKSpriteNode!
        
        public override init(size: CGSize){
            super.init(size: size)
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        override func didMove(to view: SKView) {
            //            background = SKSpriteNode(imageNamed: "backgroundClothes")
            background = SKSpriteNode(color: .white, size: frame.size)
            background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            self.background.size = self.frame.size
            self.background.zPosition = 0
            addChild(background)
            
            image1 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil2")))
            image2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil3")))
            image3 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil4")))
            image4 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil1")))
            
            self.animations(node: image1)
            self.animations(node: image2)
            self.animations(node: image3)
            self.animations(node: image4)
        }
        
        func bla(frame: CGRect){
            removeAllChildren()
            background = SKSpriteNode(color: .white, size: frame.size)
            background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            self.background.size = self.frame.size
            self.background.zPosition = 0
            addChild(background)
            
            image1 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil2")))
            image2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil3")))
            image3 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil4")))
            image4 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "perfil1")))
            
            self.animations(node: image1)
            self.animations(node: image2)
            self.animations(node: image3)
            self.animations(node: image4)
        }
        
        private func animations(node: SKSpriteNode?){
            var nodeCoyp = node
            let scale = Float.random(in: 0.3...0.7)
            nodeCoyp?.setScale(CGFloat(scale))
            nodeCoyp?.position.y = -1.0 * (nodeCoyp?.frame.height ?? 0)
            let width = Float(view!.frame.width)
            let x = Float.random(in: 0...width)
            nodeCoyp?.position.x = CGFloat(x)
            print(x)
            addChild(nodeCoyp!)
            
            //            let wait = SKAction.wait(forDuration: 2)
            if scale <= 0.5 {
                if scale >= 0.3 && scale < 0.4{
                    let duration = Float.random(in: 18...23)
                    nodeCoyp?.zPosition = 0
                    let move = SKAction.moveTo(y: self.view!.frame.height, duration: TimeInterval(duration))
                    let wait = SKAction.wait(forDuration: 3)
                    let action = SKAction.sequence([wait,move])
                    nodeCoyp?.run(action ,completion: {
                        nodeCoyp?.removeFromParent()
                        self.animations(node: nodeCoyp)
                        nodeCoyp = nil
                    })
                }else{
                    let duration = Float.random(in: 13...28)
                    nodeCoyp?.zPosition = 1
                    let move = SKAction.moveTo(y: self.view!.frame.height, duration: TimeInterval(duration))
                    let wait = SKAction.wait(forDuration: 3)
                    let action = SKAction.sequence([wait,move])
                    nodeCoyp?.run(action ,completion: {
                        nodeCoyp?.removeFromParent()
                        self.animations(node: nodeCoyp)
                        nodeCoyp = nil
                    })
                }
            }else{
                if scale >= 0.4 && scale <= 0.5{
                    let duration = Float.random(in: 4...9)
                    nodeCoyp?.zPosition = 2
                    let move = SKAction.moveTo(y: self.view!.frame.height, duration: TimeInterval(duration))
                    let wait = SKAction.wait(forDuration: 3)
                    let action = SKAction.sequence([wait,move])
                    nodeCoyp?.run(action ,completion: {
                        nodeCoyp?.removeFromParent()
                        self.animations(node: nodeCoyp)
                        nodeCoyp = nil
                    })
                }else{
                    let duration = Float.random(in: 8...13)
                    nodeCoyp?.zPosition = 3
                    let move = SKAction.moveTo(y: self.view!.frame.height, duration: TimeInterval(duration))
                    let wait = SKAction.wait(forDuration: 3)
                    let action = SKAction.sequence([wait,move])
                    nodeCoyp?.run(action ,completion: {
                        nodeCoyp?.removeFromParent()
                        self.animations(node: nodeCoyp)
                        nodeCoyp = nil
                    })
                }
            }
        }
    }
}

