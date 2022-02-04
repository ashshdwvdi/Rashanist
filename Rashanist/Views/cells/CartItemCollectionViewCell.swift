//
//  CartItemCollectionViewCell.swift
//  Rashanist
//
//  Created by Ashish Dwivedi on 04/02/22.
//

import UIKit

final class CartItemCollectionViewCell: UICollectionViewCell {
    private var imageUrl: String?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageUrl = nil
    }
    
    private func initialize() {
        addSubview(imageView)
        
        clipsToBounds = true
        layer.cornerRadius = 6.0
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configure(_ imageUrl: String) {
        self.imageUrl = imageUrl
        self.imageView.image = UIImage(named: imageUrl)
    }
}

