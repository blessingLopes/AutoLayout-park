//
//  AppDelegate.swift
//  calculatorLayout
//
//  Created by Manuel Lopes on 13/05/16.
//  Copyright © 2016 Manuel Carlos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.rootViewController = ViewController
        window?.makeKeyAndVisible()
        
        
        return true
    }

   


}

