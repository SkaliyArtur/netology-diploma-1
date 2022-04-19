//
//  AppDelegate.swift
//  MyHabits
//
//  Created by Artur Skaliy on 29.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let tabBar = UITabBarController()
    
    let habitsVC = HabitsViewController()
    let infoVC = InfoViewController()
    
    var habitsNC = UINavigationController()
    var infoNC = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        habitsNC = UINavigationController(rootViewController: habitsVC)
//        habitsNC.navigationBar.prefersLargeTitles = true
        
        infoNC = UINavigationController(rootViewController: infoVC)
        
        habitsNC.tabBarItem = .init(title: "Привычки", image: UIImage(named: "habits_tab_icon"), tag: 0)
        infoNC.tabBarItem = .init(title: "Информация", image: UIImage(systemName: "info.circle.fill"), tag: 1)
        UITabBar.appearance().tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        tabBar.viewControllers = [habitsNC, infoNC]
        
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
        return true
        
    }


}

