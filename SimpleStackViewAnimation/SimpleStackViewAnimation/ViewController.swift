//
//  ViewController.swift
//  SimpleStackViewAnimation
//
//  Created by Manuel Lopes on 08/05/16.
//  Copyright © 2016 Manuel Lopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Properties
    

    var labelsStackView: UIStackView!
    var finalStackView: UIStackView!
    var aButton: UIButton!
    var on: Bool = false
    


    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupViewController()
        setupLabels()
    }
    
    
    // MARK:- Private Convenience Methods
    
    private  func setupViewController(){

        view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    }
    
    
    private func setupLabels(){
        
        let nameLabel = UILabel(frame: .zero)
        nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.text = "Hi! My name is "
        nameLabel.textAlignment = .Center
        
        let lastNameLabel = UILabel(frame: .zero)
        lastNameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        lastNameLabel.text = "Manuel Carlos"
        lastNameLabel.textAlignment = .Center
        
        
        
        labelsStackView = UIStackView(arrangedSubviews: [nameLabel, lastNameLabel])
        labelsStackView.axis = .Vertical
        labelsStackView.spacing = 20
        
        
        aButton = UIButton(type: .System)
        aButton.setTitle("Tap", forState: .Normal)
        aButton.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        aButton.layer.cornerRadius = 5
        aButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        aButton.layer.shadowColor = UIColor.blackColor().CGColor
        aButton.layer.shadowOpacity = 0.2
        
        aButton.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        aButton.addTarget(self, action:  #selector(ViewController.action(_:)), forControlEvents: .TouchDown)
        
        finalStackView = UIStackView(arrangedSubviews: [labelsStackView, aButton])
        finalStackView.axis = .Vertical
        finalStackView.spacing = 20
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
    
        view.addSubview(finalStackView)
    

    }
    
    func action(tap: UIGestureRecognizer){
      
        on = !on
        let buttonTittle = on ? "Show" : "Hide"
        
        UIView.animateWithDuration(
            0.5,
            delay: 0.0,
            usingSpringWithDamping:  0.5,
            initialSpringVelocity: 6,
            options: [],
            animations: {
                self.labelsStackView.hidden  = self.on
                self.aButton.setTitle(buttonTittle, forState: .Normal)
            },
            completion: nil
        )
        
    }
    
    
    override func viewWillTransitionToSize( size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransitionToSize(size , withTransitionCoordinator: coordinator)
        
        let  tranf = coordinator.targetTransform()
        let invertedRotation  = CGAffineTransformInvert(tranf)
        let currentBounds = view.bounds
        let previousCenter = view.center
        
        coordinator.animateAlongsideTransition({
            context in
            
            self.view.transform = CGAffineTransformConcat(self.view.transform, invertedRotation )
            self.view.bounds = currentBounds
            
            if size.width < size.height {
                self.finalStackView.center = self.view.center
            }else{
                self.finalStackView.center = previousCenter
            }
            
            }, completion:
                    ({ finished in
                        
                        UIView.animateWithDuration(1.0,  animations: {
                        self.finalStackView.transform = CGAffineTransformConcat(self.finalStackView.transform, tranf )

                    })
                
            })
        )
    }

    
    
    override func updateViewConstraints() {
        
        // Center stackView horizontally
        let constraintsLabel_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[superview]-(<=1)-[stack]",
            options: .AlignAllCenterX,
            metrics: nil,
            views: ["superview": view, "stack":finalStackView])
        
        // center stackView vertically
        let  constraintsLabel_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[superview]-(<=1)-[stack]",
            options: .AlignAllCenterY,
            metrics: nil,
            views: ["superview":self.view, "stack":finalStackView])
        
        NSLayoutConstraint.activateConstraints(constraintsLabel_H)
        NSLayoutConstraint.activateConstraints(constraintsLabel_V)
        
        super.updateViewConstraints()
    }
    
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}// END
