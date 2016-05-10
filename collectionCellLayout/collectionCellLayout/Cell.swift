//
//  Cell.swift
//  CollectionCellLayout
//
//  Created by manuel on 10/05/16.
// 
//

import UIKit

class Cell: UICollectionViewCell {
    // not overridable type propery
    static var cellreuseIdentifier: String { return "\(self)"}
	
    
	//MARK:- Stored Properties

	let labelTemp: UILabel = UILabel()
    let land: UILabel = UILabel()
//    let city: UILabel = UILabel()
    var weatherStack: UIStackView!
    
    
    
	

	
	//MARK:- Init
	override init(frame: CGRect) {
		super.init(frame: frame)
        
        setupLabel()
    }
	
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
        setupLabel()
	}

	
		
    //MARK:- Add constraints
	
    override func updateConstraints() {
        
        // set constraint on label using Layout Guides
        let margins = contentView.layoutMarginsGuide
        
        labelTemp.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: -20).active = true
        labelTemp.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor).active = true
        
        land.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 20).active = true
        land.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor).active = true
        
        weatherStack.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 0).active = true
        weatherStack.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor,constant: 0 ).active = true
        super.updateConstraints()
    }
    
    
    
    
    //MARK:- private convenience methods
    
    
    private func makeButtonWithTitle(title: String,  fontSize: Int, color: UIColor = .whiteColor()) -> UIButton {
        let button = UIButton(type: .System)
//        button.backgroundColor = .redColor()
        button.tintColor = color
        button.setTitle(title, forState: .Normal)
        button.titleLabel?.font = .boldSystemFontOfSize(CGFloat(fontSize))
        return button
    }
    

    
    private func setupLabel(){
        
        labelTemp.textAlignment = .Center
        labelTemp.lineBreakMode = .ByTruncatingMiddle
        labelTemp.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.numberOfLines = 0
        labelTemp.textColor = .whiteColor()
        
        land.textAlignment = .Left
        land.lineBreakMode = .ByTruncatingTail
        land.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        land.translatesAutoresizingMaskIntoConstraints = false
        land.numberOfLines = 0
        land.textColor = .whiteColor()


        
        // Horizontal stackView holding the Bottom buttons
        
        let time = makeButtonWithTitle("12:93pm ", fontSize: 10)
        let sun = makeButtonWithTitle("☀︎", fontSize: 14)
       
        
        
        weatherStack = UIStackView(arrangedSubviews: [sun,  time])
        weatherStack.distribution = .FillEqually
        weatherStack.translatesAutoresizingMaskIntoConstraints = false
        

        contentView.addSubview(labelTemp)
        contentView.addSubview(land)
        contentView.addSubview(weatherStack)

        setNeedsUpdateConstraints()
        
    }

    // if this is not overriden the cells will NOT get the updated font size!
    override func prepareForReuse() {
        super.prepareForReuse()
        
        labelTemp.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        land.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }

	
}//End
