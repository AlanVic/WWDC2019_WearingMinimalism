//
//  ModelClothes.swift
//  PlaygroundBook
//
//  Created by Alan Victor Paulino de Oliveira on 21/03/19.
//

import Foundation
import UIKit

class ModelClothes{
    static var shared = ModelClothes()
    
    lazy var shirts:[UIImage] = {
        var array:[UIImage] = []
        for i in 1...7{
            let image = UIImage(named: "shirt\(i)")
            array.append(image!)
        }
        
        return array
    }()
    
    lazy var trousers:[UIImage] = {
        var array:[UIImage] = []
        for i in 1...7{
            let image = UIImage(named: "trouser\(i)")
            array.append(image!)
        }
        
        return array
    }()
}
