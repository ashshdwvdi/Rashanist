//
//  ItemCollectionViewCell.swift
//  Rashanist
//
//  Created by Ashish Dwivedi on 03/02/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    
    private var item: Item?
    private var delegate: HomeViewDelegate?
    
    override func prepareForReuse() {
        item = nil
        itemImageView.image = nil
        itemQuantityLabel.text = nil
        delegate = nil
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadow()
    }

    @IBAction func didMinus(_ sender: Any) {
        guard let quantity = item?.quantity, quantity > .zero else { return }
        item?.quantity -= 1
        itemQuantityLabel.text = item?.quantity.description
        delegate?.shouldUpdateCart()
    }
    
    @IBAction func didAdd(_ sender: Any) {
        item?.quantity += 1
        itemQuantityLabel.text = item?.quantity.description
        delegate?.shouldUpdateCart()
    }
    
    func configure(_ item: Item, delegate: HomeViewDelegate) {
        self.item = item
        self.delegate = delegate
        itemImageView.image = UIImage(named: item.imageUrl)
        itemQuantityLabel.text = item.quantity.description
    }
}

extension ItemCollectionViewCell {
    
    private func addShadow() {
        clipsToBounds = false
        layer.cornerRadius = 6.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.21
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
    }
}
