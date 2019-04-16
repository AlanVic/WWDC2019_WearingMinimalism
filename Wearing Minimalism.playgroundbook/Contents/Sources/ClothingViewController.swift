//
//  ClothingViewController.swift
//  Book_Sources
//
//  Created by Alan Victor Paulino de Oliveira on 22/03/19.
//

import UIKit
import PlaygroundSupport

class ClothingViewController: UIViewController {
    
    var clothingView:ClothingView!
    
    var generatedClothes = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        clothingView = ClothingView(frame: .zero)
        self.view = clothingView

    }
    
    func makeContraints(){
        NSLayoutConstraint.activate([
            clothingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            clothingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            clothingView.topAnchor.constraint(equalTo: view.topAnchor),
            clothingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ClothingViewController: PlaygroundLiveViewMessageHandler{
    
    
    
    public func receive(_ message: PlaygroundValue) {
        guard case let .string(generate) = message else { return }
        
        if generate == "generateClothes" && self.generatedClothes == false{
            
            generatedClothes = true
            clothingView.loadClothes()
        }
    }
}

