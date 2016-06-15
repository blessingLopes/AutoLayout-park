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
        
        labelTemp.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        labelTemp.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        land.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        land.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        city.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        city.bottomAnchor.constraint(equalTo: land.topAnchor, constant: -10).isActive = true
        
        time.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        time.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5).isActive = true
  
        super.updateConstraints()
    }
    
    
    
    
    //MARK:- private convenience methods
    
    private func setupLabel(){
        
        labelTemp.textAlignment = .center
        labelTemp.lineBreakMode = .byTruncatingMiddle
        labelTemp.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleTitle1)
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.numberOfLines = 0
        labelTemp.textColor = .white()
        
        land.textAlignment = .left
        land.lineBreakMode = .byTruncatingTail
        land.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleSubheadline)
        land.translatesAutoresizingMaskIntoConstraints = false
        land.numberOfLines = 0
        land.textColor = .white()

        city.textAlignment = .left
        city.lineBreakMode = .byTruncatingTail
        city.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleCaption2)
        city.translatesAutoresizingMaskIntoConstraints = false
        city.numberOfLines = 0
        city.textColor = .white()

        
        time.textAlignment = .left
        time.lineBreakMode = .byTruncatingTail
        time.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleCaption2)
        time.translatesAutoresizingMaskIntoConstraints = false
        time.numberOfLines = 0
        time.textColor = .white()
        
        contentView.addSubview(labelTemp)
        contentView.addSubview(land)
        contentView.addSubview(city)
        contentView.addSubview(time)

        setNeedsUpdateConstraints()
        
    }

    // if this is not overriden the cells will NOT get the updated font size!
    override func prepareForReuse() {
        super.prepareForReuse()
        
        labelTemp.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleTitle1)
        land.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleSubheadline)
    }

	
}//End
