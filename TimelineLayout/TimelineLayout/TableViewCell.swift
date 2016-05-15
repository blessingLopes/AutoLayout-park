//
//  TableViewCell.swift
//  TableViewController
//
//  Created by Manuel Lopes on 05/04/16.



import UIKit



class TableViewCell: UITableViewCell {
    
    // MARK:- Properties
    
    static var reuseIdentifier: String { return "\(self)"}
    
    let body: UILabel = UILabel()
    let name: UILabel = UILabel()
    let time: UILabel = UILabel()
    let avatar: UIImageView = UIImageView()
    let at : UILabel = UILabel()
    let buttonStack: UIStackView = UIStackView()
    
    //MARK:- Closure to build buttons
    private  var createButtonWithImage:  String -> UIButton = { name   in
        
        let button   = RippleButton(type: .Custom)
        button.setImage(UIImage(named: name), forState: .Normal)
        button.rippleBackgroundColor = .whiteColor()
        button.shadowRippleEnable = false
        button.rippleOverBounds = true
        button.widthAnchor.constraintEqualToAnchor(button.heightAnchor).active = true
        return button
    }
    

    
    //MARK:- Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)	{
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder)	{
        super.init(coder: aDecoder)
        setup()
    }
    

    
    //MARK:- Apply Constraints
    override func updateConstraints() {
        //  Layout Guides
        let margins = contentView.layoutMarginsGuide
        
        applyNameLabelConstraints(on: margins)
        applyTimeLabelConstraints(on: margins)
        applyProfilePicConstrainst(on: margins)
        applyBodyLabelConstraints(on: margins)
        applyButtonsConstraints(on: margins)
        
        super.updateConstraints()
    }
    
    
    
    //MARK: Reuse
    // if this is not overriden then not ALL the cells will get the updated font size!
    override func prepareForReuse() {
        super.prepareForReuse()
        
        name.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        time.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        body.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }

    
    
    //MARK:- Private Convenience Methods
    
    //MARK:- Create Constraints
    private func applyButtonsConstraints(on margins: UILayoutGuide){
    
        buttonStack.topAnchor.constraintEqualToAnchor(body.bottomAnchor, constant: 10).active = true
        buttonStack.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor).active = true
        buttonStack.heightAnchor.constraintEqualToConstant(20).active = true
        buttonStack.centerXAnchor.constraintEqualToAnchor(body.centerXAnchor).active = true
    }
    
    
    
    private func applyNameLabelConstraints(on margins: UILayoutGuide){

        name.leadingAnchor.constraintEqualToAnchor(avatar.trailingAnchor, constant: 10).active = true
        name.topAnchor.constraintEqualToAnchor(margins.topAnchor).active = true
    }
    
    
    
    
    private func applyTimeLabelConstraints(on margins: UILayoutGuide){
      
        time.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
        time.topAnchor.constraintEqualToAnchor(margins.topAnchor).active = true
    }
    
    
    
    private func applyBodyLabelConstraints(on margins: UILayoutGuide){
        
        body.leadingAnchor.constraintEqualToAnchor(avatar.trailingAnchor, constant: 10).active = true
        body.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
        body.topAnchor.constraintEqualToAnchor(name.bottomAnchor, constant: 10.0).active = true
    }
    
    
    
    private func applyProfilePicConstrainst(on margins: UILayoutGuide){
    
        avatar.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor,constant: -3).active = true
        avatar.topAnchor.constraintEqualToAnchor(margins.topAnchor).active = true
        avatar.heightAnchor.constraintEqualToAnchor(avatar.widthAnchor).active = true
    }
    
    
    
    
    //MARK:x Config the cell, labels, image and buttons
    private func setupPic(){
    
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.contentMode = .ScaleAspectFit

        contentView.addSubview(avatar)
    }
    
    
    
    private func setupButtons(){
    
        let reply   = createButtonWithImage("Arrow")
        let box     = createButtonWithImage("Box")
        let cloud   = createButtonWithImage("Cloud")
        let glasses = createButtonWithImage("Glasses")
        
        buttonStack.insertArrangedSubview(reply, atIndex: 0)
        buttonStack.insertArrangedSubview(box, atIndex: 1)
        buttonStack.insertArrangedSubview(cloud, atIndex: 2)
        buttonStack.insertArrangedSubview(glasses, atIndex: 3)
        buttonStack.axis = .Horizontal
        buttonStack.distribution = .FillEqually
        buttonStack.spacing = UIScreen.mainScreen().bounds.size.width / 6.5
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
    
        contentView.addSubview(buttonStack)
    }
    
    private func setupLabels(){
    
        name.numberOfLines = 0
        name.textAlignment = .Center
        name.textColor = .darkGrayColor()
        name.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        time.numberOfLines = 0
        time.textAlignment = .Center
        time.textColor = .darkGrayColor()
        time.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        time.translatesAutoresizingMaskIntoConstraints = false
        
        body.numberOfLines = 0 // set to 0 to force to display untruncated text.
        body.textAlignment = .Natural
        body.textColor = .darkGrayColor()
        body.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        body.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(name)
        contentView.addSubview(time)
        contentView.addSubview(body)
    
    }
    
    private func setup(){
        
        
        // set the separator line to full width of cell
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsetsZero
        layoutMargins = UIEdgeInsetsZero
        
        setupLabels()
        setupPic()
        setupButtons()
        
        setNeedsUpdateConstraints()
    }
    
    
    
    
    
}// ENd







