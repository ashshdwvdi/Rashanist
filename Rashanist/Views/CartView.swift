//
//  CartView.swift
//  Rashanist
//
//  Created by Ashish Dwivedi on 03/02/22.
//

import UIKit

class CartView: UIView {
    private static let cellIdentifier = "CartItemCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cart"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let printButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: "doc.circle.fill", withConfiguration: largeConfig)
        button.setImage(largeBoldDoc, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var data: [String] = []
    
    var didTapPrint: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        backgroundColor = .white
        printButton.addTarget(self, action: #selector(showPrint), for: .touchUpInside)
        
        setupCollectionView()
        setupHierarchy()
        setupLayout()
    }
    
    func updateItem(_ items: [String]) {
        self.data = items
        collectionView.reloadData()
    }
    
    @objc private func showPrint() {
        didTapPrint?()
    }
    
    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(printButton)
        addSubview(collectionView)
    }
    
    private func setupLayout() {
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        printButton.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        printButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        printButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        printButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: printButton.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CartItemCollectionViewCell.self, forCellWithReuseIdentifier: Self.cellIdentifier)
    }
}

extension CartView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.cellIdentifier, for: indexPath) as! CartItemCollectionViewCell
        cell.configure(data[indexPath.item])
        return cell
    }
}

extension CartView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 20, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 1, left: 1, bottom: 1, right: 1)
    }
}

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
