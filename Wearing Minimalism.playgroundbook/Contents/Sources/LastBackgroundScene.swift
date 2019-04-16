import UIKit
import SpriteKit
import AVFoundation

struct CategoryMask {
    static let donor: UInt32 = 0x1 << 0 // 0
    static let receptor: UInt32 = 0x1 << 1 // 1
    static let salesman: UInt32 = 0x1 << 2 // 0
    static let market: UInt32 = 0x1 << 3 // 1
    
}

class LastBackgroundScene: SKScene {
    
    var background:SKSpriteNode!
    var alanDonor:SKSpriteNode!
    var alanReceptor:SKSpriteNode!
    var alanSalesman:SKSpriteNode!
    var market:SKSpriteNode!
    
    var startTouch:CGPoint!
    var nodePosition:CGPoint!
    
    var alanDonorMoved = 0
    
    public override init(size: CGSize){
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        

        self.background = SKSpriteNode(imageNamed: "backgroundLastScene")
        self.background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.background.size = self.frame.size
        self.background.zPosition = 0
        self.addChild(self.background)

        self.alanDonor = SKSpriteNode(imageNamed: "alanDonor1")
        self.alanDonor.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY + 130)
        self.alanDonor.zPosition = 0
        self.alanDonor.physicsBody = SKPhysicsBody(rectangleOf: self.alanDonor!.frame.size)
        self.alanDonor.physicsBody?.affectedByGravity = false
        self.alanDonor.physicsBody?.categoryBitMask = CategoryMask.donor
        
        self.addChild(self.alanDonor)

        self.alanReceptor = SKSpriteNode(imageNamed: "alanReceptor1")
        self.alanReceptor.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 130)
        self.alanReceptor.physicsBody = SKPhysicsBody(rectangleOf: self.alanReceptor!.frame.size)
        self.alanReceptor.zPosition = 0
        self.alanReceptor.physicsBody?.affectedByGravity = false
        self.alanReceptor.physicsBody?.isDynamic = false
        self.alanReceptor.physicsBody?.categoryBitMask = CategoryMask.receptor
        self.alanReceptor.physicsBody?.collisionBitMask = CategoryMask.donor
        self.alanReceptor.physicsBody?.contactTestBitMask = CategoryMask.donor
        self.addChild(self.alanReceptor)
        
        self.alanSalesman = SKSpriteNode(imageNamed: "alansale1")
        self.alanSalesman.position =  CGPoint(x: self.frame.midX - 130, y: self.frame.midY - 220)
        self.alanSalesman.zPosition = 0
        self.alanSalesman.physicsBody = SKPhysicsBody(rectangleOf: self.alanSalesman!.frame.size)
        self.alanSalesman.physicsBody?.affectedByGravity = false
        self.alanSalesman.physicsBody?.categoryBitMask = CategoryMask.salesman
        
        self.addChild(self.alanSalesman)
        
        self.market = SKSpriteNode(imageNamed: "market")
        self.market.position = CGPoint(x: self.frame.midX + 130, y: self.frame.midY - 180)
        self.market.zPosition = 0
        self.market.physicsBody = SKPhysicsBody(rectangleOf: self.market!.frame.size)
        self.market.physicsBody?.affectedByGravity = false
        self.market.physicsBody?.isDynamic = false
        self.market.physicsBody?.categoryBitMask = CategoryMask.market
        self.market.physicsBody?.collisionBitMask = CategoryMask.salesman
        self.market.physicsBody?.contactTestBitMask = CategoryMask.salesman
        self.addChild(self.market)
        
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            if alanDonor.frame.contains(location){
                alanDonorMoved = 1
            }
            if alanSalesman.frame.contains(location){
                alanDonorMoved = 2
            }
        }
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            if alanDonorMoved == 1{
                alanDonor.position = CGPoint(x: location.x, y: location.y + 50)
            }else if alanDonorMoved == 2{
                alanSalesman.position = CGPoint(x: location.x, y: location.y + 50)
            }
            
//            alanDonor.run(SKAction.move(to: CGPoint(x:  nodePosition.x + location.x - startTouch.x, y: nodePosition.y + location.y - startTouch.y), duration: 0.1))
        }
    }
}

extension LastBackgroundScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        if collision == (CategoryMask.donor | CategoryMask.receptor) {
            self.alanDonor.texture = SKTexture(imageNamed: "alanDonor2")
            self.alanReceptor.texture = SKTexture(imageNamed: "alanReceptor2")
        }
        
        if collision == (CategoryMask.salesman | CategoryMask.market){
            self.alanSalesman.texture = SKTexture(imageNamed: "alansale2")
        }
        
    }
}
