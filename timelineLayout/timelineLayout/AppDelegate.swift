//
//  AppDelegate.swift
//  TableViewController
//
//  Created by Manuel Lopes on 05/04/16.
//  Copyright © 2016 Manuel Lopes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = {
            let window = UIWindow(frame: UIScreen.main().bounds)
            window.rootViewController =  UINavigationController(rootViewController: MainViewController())
            window.makeKeyAndVisible()
            
            return window
            }()
        
        return true
    }
    
    
} //END

