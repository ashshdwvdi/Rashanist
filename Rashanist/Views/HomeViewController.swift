//
//  HomeViewController.swift
//  Rashanist
//
//  Created by Ashish Dwivedi on 03/02/22.
//

import UIKit
import BubbleTransition

protocol HomeViewDelegate: AnyObject {
    func shouldUpdateCart()
}

final class HomeViewController: UIViewController {
    
    private let data: Items = .myList
    
    private static let cellIdentifier = "ItemDetailsCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let cartView: CartView = {
        let view = CartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var shouldHideCartView: Bool = true
    
    private let transition: BubbleTransition = BubbleTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(nibName: "ItemCollectionViewCell", bundle: .main),
                                forCellWithReuseIdentifier: Self.cellIdentifier)
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        cartView.clipsToBounds = false
        cartView.layer.cornerRadius = 30.0
        cartView.layer.shadowColor = UIColor.black.cgColor
        cartView.layer.shadowOpacity = 1
        cartView.layer.shadowRadius = 10
        cartView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)

        cartView.didTapPrint = printList
        cartView.isHidden = shouldHideCartView
        
        view.addSubview(cartView)
        
        cartView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        cartView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        cartView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        cartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50).isActive = true
    }
    
    let myVc = UIViewController()
    private func printList() {
        myVc.transitioningDelegate = self
        myVc.modalPresentationCapturesStatusBarAppearance = true
        myVc.modalPresentationStyle = .custom
        myVc.view.backgroundColor = .black
        self.present(myVc, animated: true, completion: nil)
    }
    
    private func updatCartItems() {
        self.cartView.updateItem(selectedItems().map(\.imageUrl))
    }
    
    private func selectedItems() -> Items {
        return self.data.filter { $0.quantity > 0 }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !shouldHideCartView {
            shouldHideCartView = true
            
            self.cartView.alpha = 1.0
            
            UIView.animate(withDuration: 0.75, delay: 0.0, options: .allowAnimatedContent) { [weak self] in
                self?.cartView.alpha = 0.0
            } completion: { [weak self] finished in
                if finished {
                    self?.cartView.isHidden = true
                }
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.configure(data[indexPath.item], delegate: self)
        cell.alpha = 0.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .allowAnimatedContent, animations: {
            cell.alpha = 1.0
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 8,
            options: [.allowUserInteraction, .allowAnimatedContent],
            animations: { [weak cell] in cell?.transform = .init(scaleX: 0.9, y: 0.9) })
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5.0,
            options: [.allowUserInteraction, .allowAnimatedContent],
            animations: { [weak cell] in cell?.transform = .identity })
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (collectionView.frame.width - 30) / 2, height: 235)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 10, bottom: 5, right: 10)
    }
}

extension HomeViewController: HomeViewDelegate {
    
    func shouldUpdateCart() {
        if !self.cartView.isHidden {
            self.updatCartItems()
        } else {
            self.cartView.isHidden = true
            self.cartView.alpha = 0
            self.shouldHideCartView = false
            
            UIView.animate(withDuration: 0.75, delay: 0.0, options: .allowAnimatedContent) { [weak self] in
                self?.cartView.alpha = 1.0
            } completion: { [weak self] finished in
                if finished {
                    self?.cartView.isHidden = false
                    self?.updatCartItems()
                }
            }
        }
    }
}


// MARK: UIViewControllerTransitioningDelegate

extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = cartView.printButton.center
        transition.bubbleColor = .black
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = cartView.printButton.center
        transition.bubbleColor = .black
        return transition
    }
}
