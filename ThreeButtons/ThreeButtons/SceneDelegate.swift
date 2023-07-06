//
//  SceneDelegate.swift
//  ThreeButtons
//
//  Created by Vyacheslav Pronin on 06.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = ViewController()
        window.rootViewController = viewController
        viewController.setup()
        window.makeKeyAndVisible()
        self.window = window
    }
}

