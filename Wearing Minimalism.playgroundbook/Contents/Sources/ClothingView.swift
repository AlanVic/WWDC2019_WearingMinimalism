//
//  ClothingViewController.swift
//  LiveViewTestApp
//
//  Created by Alan Victor Paulino de Oliveira on 21/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

class ClothingView: UIView{
    
    lazy var skView: SKView = {
       let view = SKView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        
        return view
    }()
    
    var clothingScene: ClothingScene!
    
    lazy var collectionView1:UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width:100, height: 70)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 15, right: 15)
        layout.scrollDirection = .horizontal
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.backgroundColor = .gray
        collection.layer.borderColor = UIColor.black.cgColor
        collection.layer.borderWidth = 3
        collection.layer.cornerRadius = 16
        collection.clipsToBounds = true
        
        return collection
        
    }()
    
    lazy var collectionView2:UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width:100, height: 70)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 15, right: 15)
        layout.scrollDirection = .horizontal
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.borderColor = UIColor.black.cgColor
        collection.layer.borderWidth = 3
        collection.backgroundColor = .gray
        collection.layer.cornerRadius = 16
        collection.clipsToBounds = true
        
        return collection
        
    }()
    
    var wasGeneratedClothes: Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clothingScene = ClothingScene(size: frame.size)
        clothingScene.scaleMode = .resizeFill
        
        addSubview(skView)
        addSubview(collectionView1)
        addSubview(collectionView2)
        makeContraint()
        skView.presentScene(clothingScene)
        clothingScene.backgroundColor = UIColor.red
//        clothingScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
        collectionView1.register(ModelCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        collectionView2.register(ModelCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        
    }
    
    override func layoutSubviews() {
        clothingScene.bla(frame: self.frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeContraint(){
        NSLayoutConstraint.activate([
            skView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            skView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            skView.topAnchor.constraint(equalTo: self.topAnchor),
            skView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            collectionView1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            collectionView1.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            collectionView1.heightAnchor.constraint(equalToConstant: 100),
            
            collectionView2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            collectionView2.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 16),
            collectionView2.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
    func loadClothes(){
        if wasGeneratedClothes == false{
            wasGeneratedClothes = true
            collectionView1.reloadData()
            collectionView2.reloadData()
        }
    }
}

extension ClothingView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if wasGeneratedClothes{
            if collectionView == collectionView1{
                return ModelClothes.shared.shirts.count
            }
            else{
                return ModelClothes.shared.trousers.count
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if wasGeneratedClothes{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ModelCollectionViewCell
            if collectionView == collectionView1{
                cell.imageView.image = ModelClothes.shared.shirts[indexPath.row]
            }else{
                cell.imageView.image = ModelClothes.shared.trousers[indexPath.row]
            }
            return cell
        }
        
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView1{
            clothingScene.changeShirt(image: ModelClothes.shared.shirts[indexPath.row])
        }
        else{
            clothingScene.changeTrouser(image: ModelClothes.shared.trousers[indexPath.row])
            
        }
    }

}

extension ClothingView: PlaygroundLiveViewMessageHandler{
    
    public func receive(_ message: PlaygroundValue) {
        guard case let .string(generate) = message else { return }
        
        if generate == "generateClothes" {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            view.backgroundColor = .red
            
            self.addSubview(view)
            if wasGeneratedClothes == false{
                wasGeneratedClothes = true
                collectionView1.reloadData()
                collectionView2.reloadData()
            }
        }
    }
}
