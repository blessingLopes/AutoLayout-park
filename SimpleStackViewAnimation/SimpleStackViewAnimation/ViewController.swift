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
    
    var example : String
    var labelsStackView: UIStackView!
    var aButton: UIButton!
    var on: Bool = false
    
    
    // MARK: Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        example = " hello world"
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        example = " hello !"
        super.init(coder: aDecoder)
        
    }
    
    
    init() {
        self.example = " hello !"
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: De-init
    
    
    
    deinit{
    }
    

    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupViewController()
        setupLabels()
    }
    
    
    // MARK:- Private Convenience Methods
    
    private  func setupViewController(){
        
        view.backgroundColor = .whiteColor()
        
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
        aButton.layer.borderColor = aButton.tintColor.CGColor
        aButton.layer.borderWidth = 1
        aButton.addTarget(self, action:  #selector(ViewController.action(_:)), forControlEvents: .TouchDown)
        
        let finalStackView = UIStackView(arrangedSubviews: [labelsStackView, aButton])
        finalStackView.axis = .Vertical
        finalStackView.spacing = 20
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(finalStackView)
        
        
        // Center label horizontally
        let constraintsLabel_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[superview]-(<=1)-[stack]",
            options: .AlignAllCenterX,
            metrics: nil,
            views: ["superview": view, "stack":aButton])
        
        
        
        // center Label vertically
        let  constraintsLabel_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[superview]-(<=1)-[stack]",
            options: .AlignAllCenterY,
            metrics: nil,
            views: ["superview":self.view, "stack":aButton])
        
        NSLayoutConstraint.activateConstraints(constraintsLabel_H)
        NSLayoutConstraint.activateConstraints(constraintsLabel_V)
        
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
    
    
    
}// END
