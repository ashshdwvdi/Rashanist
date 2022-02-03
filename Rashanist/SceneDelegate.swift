//
//  SceneDelegate.swift
//  Rashanist
//
//  Created by Ashish Dwivedi on 03/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeView = HomeViewController()
        let nav = UINavigationController(rootViewController: homeView)
        nav.navigationBar.prefersLargeTitles = true
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = nav
        
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

