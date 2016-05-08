//
//  AppDelegate.swift
//  SimpleStackViewAnimation
//
//  Created by Manuel Lopes on 08/05/16.
//  Copyright © 2016 Manuel Lopes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let appBounds = UIScreen.mainScreen().bounds
        
        window = UIWindow(frame: appBounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        
        return true
    }
    
}


