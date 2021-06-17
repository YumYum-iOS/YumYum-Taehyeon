//
//  SceneDelegate.swift
//  CollectionView-StickyHeader
//
//  Created by taehy.k on 2021/06/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let vc = InstagramLayoutViewController(nibName: "InstagramLayoutViewController", bundle: nil)
        self.window?.rootViewController = UINavigationController(rootViewController: vc)
        self.window?.makeKeyAndVisible()
        
    }

}

