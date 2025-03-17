//
//  AppDelegate.swift
//  Sofascore2025App
//
//  Created by Petar Majić on 08.03.2025..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = LeagueMatchesViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

