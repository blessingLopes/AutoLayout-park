//
//  ViewController.swift
//  TableViewController
//
//  Created by Manuel Lopes on 05/04/16.
//  Copyright © 2016 Manuel Lopes. All rights reserved.
//


import UIKit

// MainViewcontroller will act as container viewController for the TableviewController

class MainViewController: UIViewController {
    
    
    //Property Observer
    // keep track of which view controller is currently being displayed inside our container
    private var activeViewController : UIViewController? {
        willSet{ addActiveViewcontroller( newValue ) }
        
        // not stricly necessary since there's only one being added
        didSet{  removeInactiveViewController( oldValue ) }
        
    }
    
    
    
    // Stored Properties
    let table = TableViewContoller()
    
    
    
    
    // View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activeViewController = table
    
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK:- Private Methods
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?){
        if isViewLoaded(){
            if let inActiveVC = inactiveViewController {
                inActiveVC.willMoveToParentViewController(nil)
                inActiveVC.view.removeFromSuperview()
                inActiveVC.removeFromParentViewController()
            }
        }
        
    }
    
    private func addActiveViewcontroller(activeViewController: UIViewController?){
        if isViewLoaded(){
            if let activeVC = activeViewController{
                addChildViewController(activeVC)
                activeVC.view.frame = view.bounds
                view.addSubview(activeVC.view)
                activeVC.didMoveToParentViewController(self)
            }
        }
    }
    
    
    
    
    
    
}// ENd



