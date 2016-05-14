//
//  PortraitView.swift
//  alternateViews
//
//  Created by Manuel Lopes on 11/05/16.

//

import UIKit

class PortraitView: UIView{


override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setup()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.setup()
}

convenience init() {
    self.init(frame: CGRectZero)
}

func setup() {
    
    let margins  = self.layoutMarginsGuide
    backgroundColor = .whiteColor()
    
    let title = setupTitle()
    let profileView = setUpProfilePic()
    let desc = setUpDescription()
    let plus = makeButtonWithTitle("+", fontSize: 20)
    let back = makeButtonWithTitle("<", fontSize: 20)
    
    addSubview(title)
    addSubview(profileView)
    addSubview(desc)
    addSubview(plus)
    addSubview(back)
    
    // Center title horizontally
    let constraintsLabel_H = NSLayoutConstraint.constraintsWithVisualFormat(
        "V:[superview]-(<=1)-[label]",
        options: .AlignAllCenterX,
        metrics: nil,
        views: ["superview": self, "label":title])
    
    
    
    // center title vertically
    let  constraintsLabel_V = NSLayoutConstraint.constraintsWithVisualFormat(
        "H:[superview]-(<=1)-[label]",
        options: .AlignAllCenterY,
        metrics: nil,
        views: ["superview":self, "label":title])
    
    NSLayoutConstraint.activateConstraints(constraintsLabel_H)
    NSLayoutConstraint.activateConstraints(constraintsLabel_V)
    
    
    //  -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   //

    // Center profilePic horizontally
    let constraintsPicture_H = NSLayoutConstraint.constraintsWithVisualFormat(
        "V:[superview]-(<=1)-[image]",
        options: .AlignAllCenterX,
        metrics: nil,
        views: ["superview": self, "image":profileView])
    
    NSLayoutConstraint.activateConstraints(constraintsPicture_H)
    
    // position profilePic verticaly

    profileView.topAnchor.constraintEqualToAnchor(margins.topAnchor,constant: 100).active = true
    profileView.bottomAnchor.constraintEqualToAnchor(title.topAnchor,constant: -20).active = true
    
    //  -   -   -   -   -   -   -   -   -   -   -   -   -   -    -   -   //
    
    // Center description horizontally
    let constraintsDescription_H = NSLayoutConstraint.constraintsWithVisualFormat(
        "V:[superview]-(<=1)-[desc]",
        options: .AlignAllCenterX,
        metrics: nil,
        views: ["superview": self, "desc": desc])
    
    NSLayoutConstraint.activateConstraints(constraintsDescription_H)
    
    // position description verticaly
    
    desc.topAnchor.constraintEqualToAnchor(title.bottomAnchor,constant: 10).active = true
    desc.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -90).active = true
    desc.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 30).active = true
    desc.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: -30).active = true

    
    //  -   -   -   -   -   -   -   -   -   -   -   -   -   -    -   -   //

    
    
    
    
    //position Buttons
    
    plus.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -30).active  = true
    plus.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: -20).active = true
    
    back.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -30).active  = true
    back.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 20).active = true

    
}

    
    //MARK:- Creating the UI Elements
    private func setupTitle()  -> UILabel{
        let lab = UILabel()
        lab.text = "Mr. Fantastic Fox"
        lab.font = UIFont.systemFontOfSize(40)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.layer.cornerRadius = 10
        lab.clipsToBounds = true
        lab.layer.shadowColor = UIColor.blackColor().CGColor
        lab.layer.shadowOffset = CGSize(width: 1, height: 1)
        lab.layer.shadowOpacity = 0.2
        lab.layer.shadowRadius = 0.1
        return lab
    
    }
    
    private func setUpProfilePic() -> UIImageView{
        let pic = UIImageView(image: UIImage(named: "me"))
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.contentMode = .ScaleAspectFit

        return pic
    }
    
    
    private func setUpDescription() -> UILabel{
        let desc = UILabel()
        desc.text = "Mr. Fox, now a newspaper columnist, moves the family into a better home in the base of a tree, ignoring the warnings of his lawyer Badger about how dangerous the area is for foxes."
        desc.textAlignment = .Center
        desc.numberOfLines = 0
        desc.font = UIFont.systemFontOfSize(14)
        desc.translatesAutoresizingMaskIntoConstraints = false

        return desc
    }
    
    
    
    
    private func makeButtonWithTitle(title: String,  fontSize: Int) -> UIButton {
        let button = UIButton(type: .System)
        
        button.tintColor = .redColor()
        button.setTitle(title, forState: .Normal)
        button.titleLabel?.font = .boldSystemFontOfSize(CGFloat(fontSize))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    
    

}//End