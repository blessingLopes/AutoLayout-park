//
//  LandscapeView.swift
//  alternateViews
//
//  Created by Manuel Lopes on 11/05/16.

//

import UIKit


class LandscapeView: UIView{


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
        
        setup()
    }
    
    
    
    
   private func setup() {
        let margins = self.layoutMarginsGuide
        backgroundColor = .whiteColor()

        let title: UILabel = setupTitle()
        let pic = setUpProfilePic()
        let plus = makeButtonWithTitle("+", fontSize: 20)
        let back = makeButtonWithTitle("<", fontSize: 20)
    
        
        addSubview(title)
        addSubview(pic)
        addSubview(plus)
        addSubview(back)
    
    //-  -  -  -  -   -     -   -   -   -   -    -   -   -    -   -   -   -   -//
        
        // Center title horizontally
        let constraintsLabel_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[superview]-(<=1)-[title]",
            options: .AlignAllCenterX,
            metrics: nil,
            views: ["superview": self, "title":title])
        
        
        
        // center title vertically
        let  constraintsLabel_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[superview]-(<=1)-[title]",
            options: .AlignAllCenterY,
            metrics: nil,
            views: ["superview":self, "title":title])
        
        NSLayoutConstraint.activateConstraints(constraintsLabel_H)
        NSLayoutConstraint.activateConstraints(constraintsLabel_V)
        
        
   //-  -  -  -  -   -     -   -   -   -   -    -   -   -    -   -   -   -   -//
        // Center profilePic horizontally
        let constraintsPicture_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[superview]-(<=1)-[image]",
            options: .AlignAllCenterX,
            metrics: nil,
            views: ["superview": self, "image":pic])
        
        NSLayoutConstraint.activateConstraints(constraintsPicture_H)

        
        //position pic Vertically
        pic.topAnchor.constraintEqualToAnchor(title.bottomAnchor,constant: 10).active = true
        pic.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -50).active = true

        
    //-  -  -  -  -   -     -   -   -   -   -    -   -   -    -   -   -   -   -//
        
        //position Buttons
        
        plus.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 20).active  = true
        plus.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: -20).active = true
        
        back.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 20).active  = true
        back.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 20).active = true
        
        

    }
    
    
    
// equivalent to viweWillAppear()
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        // nothing here for now
    }

// equivalente to viewWillLayoutSubviews() and viewDidLayoutSubviews()
    override func layoutSubviews() {
        super.layoutSubviews()
        // nothing here for now
    }

    
    private func setUpProfilePic() -> UIImageView{
        let pic = UIImageView(image: UIImage(named: "me"))
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.contentMode = .ScaleAspectFit
        return pic
    }
 
    private func setupTitle()  -> UILabel{
        let lab = UILabel()
        lab.text = "Mr. Fox in Landscape"
        lab.font = UIFont.systemFontOfSize(60)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
        
    }
    
    
    private func makeButtonWithTitle(title: String,  fontSize: Int) -> UIButton {
        let button = UIButton(type: .System)

        button.tintColor = .redColor()
        button.setTitle(title, forState: .Normal)
        button.titleLabel?.font = .boldSystemFontOfSize(CGFloat(fontSize))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    


}
