//
//  SceneDelegate.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let dataManager = DataManager()
        let mainVM = MainViewModel(dataManager: dataManager)
        let mainVC = MainViewController(viewModel: mainVM)
        
        let naviVC = UINavigationController(rootViewController: mainVC)
        
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
    }
}

