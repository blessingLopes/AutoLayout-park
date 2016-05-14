//
//  ViewController.swift
//  alternateViews
//
//  Created by Manuel Lopes on 11/05/16.

//

import UIKit

class ViewController: UIViewController {

    
    let port = PortraitView(frame: UIScreen.mainScreen().bounds)
    let land = LandscapeView(frame: UIScreen.mainScreen().bounds)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        land.alpha = 0.0
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        land.frame = view.bounds
        port.frame = view.bounds

    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(port)
        view.addSubview(land)
        
    }

    
    // MARK:- Handle Device Rotation
    override func viewWillTransitionToSize( size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransitionToSize(size , withTransitionCoordinator: coordinator)
        
        let viewForCurrentOrientation = size.width > size.height ? port : land 
        let viewForFinal = size.width > size.height ? land  : port
        
        let snapshot = viewForCurrentOrientation.snapshotViewAfterScreenUpdates(false)
        snapshot.frame = viewForCurrentOrientation.frame;
        snapshot.autoresizingMask = [.FlexibleWidth , .FlexibleHeight]
        
        view.insertSubview(snapshot, aboveSubview: viewForCurrentOrientation)
        viewForFinal.alpha = 0

        coordinator.animateAlongsideTransition({
            context in
            
             snapshot.alpha = 0.0
             viewForFinal.alpha = 1.0
             viewForCurrentOrientation.alpha = 0
            
            }, completion: { _ in
                
                snapshot.removeFromSuperview()
                
        }  )

    
    }


    
    
}// ENd

