//
//  AppDelegate.swift
//  playerLayout
//
//  Created by Manuel Lopes on 09/05/16.
//  Copyright © 2016 Manuel Lopes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool  {
     
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = PlayerViewController()
        window?.makeKeyAndVisible()
        
        return true
    }




}

