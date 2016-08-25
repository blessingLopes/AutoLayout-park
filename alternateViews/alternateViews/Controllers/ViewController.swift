//
//  ViewController.swift
//  alternateViews
//
//  Created by Manuel Lopes on 11/05/16.

//

import UIKit

class ViewController: UIViewController {

    
    let port = PortraitView(frame: UIScreen.main.bounds)
    let land = LandscapeView(frame: UIScreen.main.bounds)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        land.alpha = 0.0
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        land.frame = view.bounds
        port.frame = view.bounds

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(port)
        view.addSubview(land)
        
    }

    
    // MARK:- Handle Device Rotation
    override func viewWillTransition( to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransition(to: size , with: coordinator)
        
        let viewForCurrentOrientation = size.width > size.height ? port : land 
        let viewForFinal = size.width > size.height ? land  : port
        
        let snapshot = viewForCurrentOrientation.snapshotView(afterScreenUpdates: false)
        snapshot?.frame = viewForCurrentOrientation.frame;
        snapshot?.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        
        view.insertSubview(snapshot!, aboveSubview: viewForCurrentOrientation)
        viewForFinal.alpha = 0

        coordinator.animate(alongsideTransition:
            { _ in
                snapshot?.alpha = 0.0
                viewForFinal.alpha = 1.0
                viewForCurrentOrientation.alpha = 0
            
            }, completion:
                { _ in snapshot?.removeFromSuperview()
                
                }
        )

    
    }


    
    
}// ENd

