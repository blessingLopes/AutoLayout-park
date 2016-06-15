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
    self.init(frame: CGRect.zero)
}

func setup() {
    
    let margins  = self.layoutMarginsGuide
    backgroundColor = .white()
    
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
    let constraintsLabel_H = NSLayoutConstraint.constraints(
        withVisualFormat: "V:[superview]-(<=1)-[label]",
        options: .alignAllCenterX,
        metrics: nil,
        views: ["superview": self, "label":title])
    
    
    
    // center title vertically
    let  constraintsLabel_V = NSLayoutConstraint.constraints(
        withVisualFormat: "H:[superview]-(<=1)-[label]",
        options: .alignAllCenterY,
        metrics: nil,
        views: ["superview":self, "label":title])
    
    NSLayoutConstraint.activate(constraintsLabel_H)
    NSLayoutConstraint.activate(constraintsLabel_V)
    
    
    //  -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   //

    // Center profilePic horizontally
    let constraintsPicture_H = NSLayoutConstraint.constraints(
        withVisualFormat: "V:[superview]-(<=1)-[image]",
        options: .alignAllCenterX,
        metrics: nil,
        views: ["superview": self, "image":profileView])
    
    NSLayoutConstraint.activate(constraintsPicture_H)
    
    // position profilePic verticaly

    profileView.topAnchor.constraint(equalTo: margins.topAnchor,constant: 100).isActive = true
    profileView.bottomAnchor.constraint(equalTo: title.topAnchor,constant: -20).isActive = true
    
    //  -   -   -   -   -   -   -   -   -   -   -   -   -   -    -   -   //
    
    // Center description horizontally
    let constraintsDescription_H = NSLayoutConstraint.constraints(
        withVisualFormat: "V:[superview]-(<=1)-[desc]",
        options: .alignAllCenterX,
        metrics: nil,
        views: ["superview": self, "desc": desc])
    
    NSLayoutConstraint.activate(constraintsDescription_H)
    
    // position description verticaly
    
    desc.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 10).isActive = true
    desc.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -90).isActive = true
    desc.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 30).isActive = true
    desc.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -30).isActive = true

    
    //  -   -   -   -   -   -   -   -   -   -   -   -   -   -    -   -   //

    
    
    
    
    //position Buttons
    
    plus.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30).isActive  = true
    plus.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
    
    back.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30).isActive  = true
    back.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true

    
}

    
    //MARK:- Creating the UI Elements
    private func setupTitle()  -> UILabel{
        let lab = UILabel()
        lab.text = "Mr. Fantastic Fox"
        lab.font = UIFont.systemFont(ofSize: 40)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.layer.cornerRadius = 10
        lab.clipsToBounds = true
        lab.layer.shadowColor = UIColor.black().cgColor
        lab.layer.shadowOffset = CGSize(width: 1, height: 1)
        lab.layer.shadowOpacity = 0.2
        lab.layer.shadowRadius = 0.1
        return lab
    
    }
    
    private func setUpProfilePic() -> UIImageView{
        let pic = UIImageView(image: UIImage(named: "me"))
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.contentMode = .scaleAspectFit

        return pic
    }
    
    
    private func setUpDescription() -> UILabel{
        let desc = UILabel()
        desc.text = "Mr. Fox, now a newspaper columnist, moves the family into a better home in the base of a tree, ignoring the warnings of his lawyer Badger about how dangerous the area is for foxes."
        desc.textAlignment = .center
        desc.numberOfLines = 0
        desc.font = UIFont.systemFont(ofSize: 14)
        desc.translatesAutoresizingMaskIntoConstraints = false

        return desc
    }
    
    
    
    
    private func makeButtonWithTitle(_ title: String,  fontSize: Int) -> UIButton {
        let button = UIButton(type: .system)
        
        button.tintColor = .red()
        button.setTitle(title, for: UIControlState())
        button.titleLabel?.font = .boldSystemFont(ofSize: CGFloat(fontSize))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    
    

}//End
