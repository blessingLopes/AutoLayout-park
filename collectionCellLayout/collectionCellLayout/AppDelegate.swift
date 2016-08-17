//
//  AppDelegate.swift
//  CollectionCellLayout
//
//  Created by manuel on 10/05/16.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool{
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let theLayout : Layout = Layout()
        window?.rootViewController = CollectionViewController(collectionViewLayout: theLayout)
      
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
}//End
