//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport
import SpriteKit

public func instantiateLiveViewMinimalist(scene:LifeMinimalist) -> PlaygroundLiveViewable {
    let view = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
    
    var sceneAnimation:SKScene!
    
    switch scene {
    case .fewClothes:
        sceneAnimation = FirstSceneAnimation(size: CGSize(width: 512, height: 768))
    case .minimalist:
        sceneAnimation = SecondSceneAnimation(size: CGSize(width: 512, height: 768))
    case .manyClothes:
        sceneAnimation = ThirdSceneAnimation(size: CGSize(width: 512, height: 768))
    case .undefined:
        sceneAnimation = UndefinedSceneAnimation(size: CGSize(width: 512, height: 768))
    }
    
    sceneAnimation.scaleMode = .aspectFill
    view.presentScene(sceneAnimation, transition: SKTransition.fade(withDuration: 3))
    
    return view
}

public func instatiateLiveViewClothes() -> PlaygroundLiveViewable{
    return ClothingViewController()
    
}

public func instatiateLiveViewLastPage() -> PlaygroundLiveViewable{
    let view = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
    
    let sceneAnimation = LastBackgroundScene(size: CGSize(width: 512, height: 768))
    sceneAnimation.scaleMode = .aspectFill
    
    view.presentScene(sceneAnimation, transition: SKTransition.fade(withDuration: 3))
    
    return view
    
}

public func instantiateLiveViewAboutMe() -> PlaygroundLiveViewable{
    return AboutMeViewController()
}

public func generateView(scene:LifeMinimalist){
    PlaygroundPage.current.liveView = instantiateLiveViewMinimalist(scene: scene)
}
