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
    let city: UILabel = UILabel()
    let time: UILabel = UILabel()

	
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
        
        city.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 0).active = true
        city.bottomAnchor.constraintEqualToAnchor(land.topAnchor, constant: -10).active = true
        
        time.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: -10).active = true
        time.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 5).active = true
  
        super.updateConstraints()
    }
    
    
    
    
    //MARK:- private convenience methods
    
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

        city.textAlignment = .Left
        city.lineBreakMode = .ByTruncatingTail
        city.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        city.translatesAutoresizingMaskIntoConstraints = false
        city.numberOfLines = 0
        city.textColor = .whiteColor()

        
        time.textAlignment = .Left
        time.lineBreakMode = .ByTruncatingTail
        time.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        time.translatesAutoresizingMaskIntoConstraints = false
        time.numberOfLines = 0
        time.textColor = .whiteColor()
        
        contentView.addSubview(labelTemp)
        contentView.addSubview(land)
        contentView.addSubview(city)
        contentView.addSubview(time)

        setNeedsUpdateConstraints()
        
    }

    // if this is not overriden the cells will NOT get the updated font size!
    override func prepareForReuse() {
        super.prepareForReuse()
        
        labelTemp.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        land.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }

	
}//End
