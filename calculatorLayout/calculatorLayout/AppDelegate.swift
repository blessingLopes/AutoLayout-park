//
//  AppDelegate.swift
//  calculatorLayout
//
//  Created by Manuel Lopes on 12/05/16.
//  Copyright © 2016 Manuel Lopes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main().bounds)
        window?.rootViewController = CalculatorViewController()
        window?.makeKeyAndVisible()
        return true
    }

 


}

