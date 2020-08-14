//
//  SceneDelegate.swift
//  KanjiSRS
//
//  Created by Scott Enriquez on 8/14/20.
//  Copyright © 2020 Scott Enriquez. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchViewController)
    }
    
    func createKanjiListNavigationController() -> UINavigationController {
        let kanjiListViewController = KanjiListViewController()
        kanjiListViewController.title = "Kanji"
        kanjiListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        return UINavigationController(rootViewController: kanjiListViewController)
    }
    
    func createStudyListNavigationController() -> UINavigationController {
        let studyListViewController = StudyListViewController()
        studyListViewController.title = "Study"
        studyListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        return UINavigationController(rootViewController: studyListViewController)
    }
    
    func createTabBarController() -> UITabBarController {
       let tabBarController = UITabBarController()
        tabBarController.viewControllers = [createSearchNavigationController(), createKanjiListNavigationController(), createStudyListNavigationController()]
        UITabBar.appearance().tintColor = .systemIndigo
        return tabBarController
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

