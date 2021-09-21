//
//  AppDelegate.swift
//  BeerList
//
//  Created by Roberto Herranz on 21/9/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let beerWireframe = BeerListWireframe.init()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = beerWireframe.viewController
        window?.makeKeyAndVisible()

        return true
    }

}

