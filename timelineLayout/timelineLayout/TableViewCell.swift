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
    private  var createButtonWithImage:  (String) -> UIButton = { name   in
        
        let button   = RippleButton(type: .custom)
        button.setImage(UIImage(named: name), for: UIControlState())
        button.rippleBackgroundColor = .red()
        button.shadowRippleEnable = false
        button.rippleOverBounds = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
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
        
        name.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleHeadline)
        time.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleSubheadline)
        body.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleBody)
    }

    
    
    //MARK:- Private Convenience Methods
    
    //MARK:- Create Constraints
    private func applyButtonsConstraints(on margins: UILayoutGuide){
    
        buttonStack.topAnchor.constraint(equalTo: body.bottomAnchor, constant: 10).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonStack.centerXAnchor.constraint(equalTo: body.centerXAnchor).isActive = true
    }
    
    
    
    private func applyNameLabelConstraints(on margins: UILayoutGuide){

        name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        name.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    }
    
    
    
    
    private func applyTimeLabelConstraints(on margins: UILayoutGuide){
      
        time.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        time.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    }
    
    
    
    private func applyBodyLabelConstraints(on margins: UILayoutGuide){
        
        body.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        body.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        body.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10.0).isActive = true
    }
    
    
    
    private func applyProfilePicConstrainst(on margins: UILayoutGuide){
    
        avatar.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: -3).isActive = true
        avatar.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor).isActive = true
    }
    
    
    
    
    //MARK:x Config the cell, labels, image and buttons
    private func setupPic(){
    
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.contentMode = .scaleAspectFit

        contentView.addSubview(avatar)
    }
    
    
    
    private func setupButtons(){
    
        let reply   = createButtonWithImage("Arrow")
        let box     = createButtonWithImage("Box")
        let cloud   = createButtonWithImage("Cloud")
        let glasses = createButtonWithImage("Glasses")
        
        buttonStack.insertArrangedSubview(reply, at: 0)
        buttonStack.insertArrangedSubview(box, at: 1)
        buttonStack.insertArrangedSubview(cloud, at: 2)
        buttonStack.insertArrangedSubview(glasses, at: 3)
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = UIScreen.main().bounds.size.width / 6.5
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
    
        contentView.addSubview(buttonStack)
    }
    
    private func setupLabels(){
    
        name.numberOfLines = 0
        name.textAlignment = .center
        name.textColor = .darkGray()
        name.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleHeadline)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        time.numberOfLines = 0
        time.textAlignment = .center
        time.textColor = .darkGray()
        time.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleSubheadline)
        time.translatesAutoresizingMaskIntoConstraints = false
        
        body.numberOfLines = 0 // set to 0 to force to display untruncated text.
        body.textAlignment = .natural
        body.textColor = .darkGray()
        body.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleBody)
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







