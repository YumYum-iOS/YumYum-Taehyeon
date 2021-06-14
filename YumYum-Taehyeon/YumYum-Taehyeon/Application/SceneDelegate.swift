//
//  SceneDelegate.swift
//  YumYum-Taehyeon
//
//  Created by taehy.k on 2021/06/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let rootVC = SplashViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
    }


}

