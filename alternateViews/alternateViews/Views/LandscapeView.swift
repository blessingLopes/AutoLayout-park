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
        self.init(frame: CGRect.zero)
  
    }
    
    
    
    
   private func setup() {
        let margins = self.layoutMarginsGuide
        backgroundColor = .white()

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
        let constraintsLabel_H = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[superview]-(<=1)-[title]",
            options: .alignAllCenterX,
            metrics: nil,
            views: ["superview": self, "title":title])
        
        
        
        // center title vertically
        let  constraintsLabel_V = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[superview]-(<=1)-[title]",
            options: .alignAllCenterY,
            metrics: nil,
            views: ["superview":self, "title":title])
        
        NSLayoutConstraint.activate(constraintsLabel_H)
        NSLayoutConstraint.activate(constraintsLabel_V)
        
        
   //-  -  -  -  -   -     -   -   -   -   -    -   -   -    -   -   -   -   -//
        // Center profilePic horizontally
        let constraintsPicture_H = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[superview]-(<=1)-[image]",
            options: .alignAllCenterX,
            metrics: nil,
            views: ["superview": self, "image":pic])
        
        NSLayoutConstraint.activate(constraintsPicture_H)

        
        //position pic Vertically
        pic.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 10).isActive = true
        pic.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -50).isActive = true

        
    //-  -  -  -  -   -     -   -   -   -   -    -   -   -    -   -   -   -   -//
        
        //position Buttons
        
        plus.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive  = true
        plus.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        
        back.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive  = true
        back.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        
        

    }
    
    
    
// equivalent to viweWillAppear()
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
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
        pic.contentMode = .scaleAspectFit
        return pic
    }
 
    private func setupTitle()  -> UILabel{
        let lab = UILabel()
        lab.text = "Mr. Fox in Landscape"
        lab.font = UIFont.systemFont(ofSize: 60)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
        
    }
    
    
    private func makeButtonWithTitle(_ title: String,  fontSize: Int) -> UIButton {
        let button = UIButton(type: .system)

        button.tintColor = .red()
        button.setTitle(title, for: UIControlState())
        button.titleLabel?.font = .boldSystemFont(ofSize: CGFloat(fontSize))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    


}
