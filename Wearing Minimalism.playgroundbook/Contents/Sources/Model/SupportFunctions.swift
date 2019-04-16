//
//  supportFunctions.swift
//  LiveViewTestApp
//
//  Created by Alan Victor Paulino de Oliveira on 22/03/19.
//

import Foundation

public enum LifeMinimalist{
    case fewClothes
    case minimalist
    case manyClothes
    case undefined
}


public func toCheckLogicMinimalist(numberWashesPerMonth washesPerMonth:Double, numberOfShirt shirts:Double, numberTrousers trousers:Double) -> LifeMinimalist{
    var tempCheck:LifeMinimalist = .undefined
    
    //taxa de Blusas
    let toleranceShirts:Double = 2
    let toleranceTrousers:Double = 1
    //taxa de Calças
    
    //numero de lavagem por semana(washesPerWeek)
    var washesPerWeek = washesPerMonth/4
    washesPerWeek.round()
    
    let shirtsNeeded:Double = 7 / washesPerWeek
    
    let difShirt = shirtsNeeded - shirts
    
    let trousersNeeded:Double = shirtsNeeded / 3
    
    let difTrouser = trousersNeeded - trousers
    
    if trousers <= 1 && shirts <= 1{
        print("Tem de menos calcas")
        print("Tem de menos blusas")
        
        tempCheck = .fewClothes
    }else if trousers == 0{
        print("Tem de menos calcas")
        tempCheck = .fewClothes
    }else if shirts == 0{
        print("Tem de menos blusas")
        tempCheck = .fewClothes
        
    }
    
    if abs(difShirt) >= toleranceShirts {
        print(difShirt)
        if difShirt < 0{
            print("Tem demais")
            tempCheck = .manyClothes
        }else{
            print("tem de menos")
            tempCheck = .fewClothes
        }
    }else{
        print("minimalista em blusas")
        tempCheck = .minimalist
    }
    
    if abs(difTrouser) >= toleranceTrousers{
        if difTrouser < 0{
            print("Tem demais")
            tempCheck = .manyClothes
        }else{
            print("tem de menos")
            tempCheck = .fewClothes
        }
    }else{
        print("minimalista em calcas")
        tempCheck = .minimalist
    }
    
    return tempCheck
}

