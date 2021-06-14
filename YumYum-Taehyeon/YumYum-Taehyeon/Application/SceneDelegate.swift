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
        
        // 스플래시 뷰가 나온 후 2초 뒤에 홈 뷰 노출
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let homeNavigationController = UINavigationController(rootViewController: HomeViewController())
            self.window?.rootViewController = homeNavigationController
            self.window?.makeKeyAndVisible()
        }
    }


}

