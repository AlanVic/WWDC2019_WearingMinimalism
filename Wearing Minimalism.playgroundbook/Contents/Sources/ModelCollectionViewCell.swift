//
//  ModelCollectionViewCell.swift
//  LiveViewTestApp
//
//  Created by Alan Victor Paulino de Oliveira on 21/03/19.
//

import UIKit

class ModelCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override var isSelected: Bool{
        didSet{
            if isSelected == true{
                imageView.alpha = 0.3
//                imageView.layer.borderWidth = 3
                            }else{
                imageView.alpha = 1
//                imageView.layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(){
        addSubview(imageView)
        makeContraints()
    }
    
    func makeContraints(){
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8)
            ])
    }
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = 15
        imageView.layer.borderColor = UIColor.black.cgColor

    }
}
