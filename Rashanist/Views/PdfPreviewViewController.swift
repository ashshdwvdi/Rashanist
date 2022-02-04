//
//  PdfPreviewViewController.swift
//  Rashanist
//
//  Created by Ashish Dwivedi on 04/02/22.
//

import Foundation
import PDFKit

final class PdfPreviewViewController: UIViewController {
    private let preview: PDFView = {
        let view = PDFView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .small)
        let image = UIImage(systemName: "xmark.circle.fill", withConfiguration: largeConfig)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .small)
        let image = UIImage(systemName: "square.and.arrow.up.fill", withConfiguration: largeConfig)
        button.tintColor = .black
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let items: Items
    
    init(_ itemList: Items) {
        self.items = itemList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Lol no!")
    }
    
    override func loadView() {
        super.loadView()
        
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        closeButton.addTarget(self, action: #selector(didCloseTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didShareTapped), for: .touchUpInside)
        
        view.addSubview(closeButton)
        view.addSubview(shareButton)
        view.addSubview(preview)
        
        closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        shareButton.topAnchor.constraint(equalTo: closeButton.topAnchor).isActive = true
        shareButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        preview.leadingAnchor.constraint(equalTo: closeButton.leadingAnchor).isActive = true
        preview.trailingAnchor.constraint(equalTo: shareButton.trailingAnchor).isActive = true
        preview.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 5).isActive = true
        preview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc private func didCloseTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didShareTapped() {
        
    }
}
