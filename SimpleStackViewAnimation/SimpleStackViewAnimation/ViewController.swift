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
    

    var finalStackView: UIStackView!
    var aButton: UIButton!
    var on: Bool = false
    
    let avatarImageHeight: CGFloat = 150.0


    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupViewController()
        setupStackViews()
    }
    
    
    // MARK:- Private Convenience Methods
    
    private  func setupViewController(){

        view.backgroundColor = .whiteColor()
    }
    
    
    private func setupStackViews(){
 
        let userPic = UIImageView(image: UIImage(named: "profilePic.jpg")!)
        userPic.contentMode = .ScaleAspectFit
        userPic.clipsToBounds = true
        userPic.layer.cornerRadius = 25


       
        let nameLabel = UILabel(frame: .zero)
        nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        nameLabel.text = "Hi, I'm Manuel Carlos"
        nameLabel.textAlignment = .Center
        
        
        
        let userProfileView = UIStackView(arrangedSubviews: [userPic, nameLabel])
        userProfileView.axis = .Vertical
        userProfileView.spacing = 30
        userProfileView.distribution = UIStackViewDistribution.EqualCentering
   
        
        // better  be set only after the view has been added to the stackView
        userPic.widthAnchor.constraintEqualToConstant(avatarImageHeight).active = true
        userPic.heightAnchor.constraintEqualToConstant(avatarImageHeight).active = true

        
        // setup a simple button
        aButton = UIButton(type: .System)
        aButton.setTitle("Tap", forState: .Normal)
        aButton.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        aButton.layer.cornerRadius = 10
        aButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        aButton.layer.shadowColor = UIColor.blackColor().CGColor
        aButton.layer.shadowOpacity = 0.1
        aButton.backgroundColor = .redColor()
        aButton.tintColor = .whiteColor()
        aButton.addTarget(self, action:  #selector(ViewController.action(_:)), forControlEvents: .TouchDown)
        
        
        finalStackView = UIStackView(arrangedSubviews: [userProfileView, aButton])
        finalStackView.axis = .Vertical
        finalStackView.spacing = 20
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
    
    
        view.addSubview(finalStackView)
   

    }
    
    //MARK: - Button action
    
    func action(tap: UIGestureRecognizer){
      
        on = !on
        let buttonTittle = on ? "Show" : "Hide"
        let topStack = finalStackView.arrangedSubviews[0]
        
        UIView.animateWithDuration(
            0.5,
            delay: 0.0,
            usingSpringWithDamping:  0.5,
            initialSpringVelocity: 6,
            options: [],
            animations: {
                topStack.hidden  = self.on
                
                self.aButton.setTitle(buttonTittle, forState: .Normal)
            },
            completion: nil
        )
        
    }
    
    // MARK:- Handle Device Rotation
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
            
            
            if size.width < size.height { self.finalStackView.center = self.view.center }
            else{   self.finalStackView.center = previousCenter }
            
            
            }, completion:
                    ({ _ in
                        UIView.animateWithDuration(1.0,  animations: {
                            self.finalStackView.transform = CGAffineTransformConcat(self.finalStackView.transform, tranf )
                        
                    })
            })
        )
    }

    
    
    
    
    //MARK:- center the stacks
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
    
    
    //MARK:- Status bar preferences
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}// END
