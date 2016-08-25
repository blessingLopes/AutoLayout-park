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
    setup()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
}

convenience init() {
    self.init(frame: CGRect.zero)
}

func setup() {
    
    let margins  = self.layoutMarginsGuide
    backgroundColor = #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1)
    
    let title = setupTitle
    let profileView = setUpProfilePic
    let desc = setUpDescription
    let plus = makeButtonWith("+", 20)
    let back = makeButtonWith("<", 20)
    
    addSubview(title)
    addSubview(profileView)
    addSubview(desc)
    addSubview(plus)
    addSubview(back)

    /*     Setting up constraints     */
    
    // Center title horizontally
    title.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    
    // center title vertically
    title.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
    
    
    //  -   -   -   -   -   -   Layout the Profile fox Picture -   -   -   -   -   -   -   -   -   -   //

    // Center profilePic horizontally
    profileView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    
    // position profilePic verticaly
    profileView.topAnchor.constraint(equalTo: margins.topAnchor,constant: 100).isActive = true
    profileView.bottomAnchor.constraint(equalTo: title.topAnchor,constant: -20).isActive = true
    
    
    
    //  -   -   -   -   -   -   Layout the Description Label -   -   -   -   -   -   -    -   -   //
    
    // Center description horizontally
    desc.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    
    // position description verticaly
    desc.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 10).isActive = true
    desc.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -90).isActive = true
    desc.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 30).isActive = true
    desc.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -30).isActive = true

    
    //  -   -   -   -   -   -  Layout the < and + buttons at the bottom -   -   -   -   -   -   -   -    -   -   //
    
    plus.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30).isActive  = true
    plus.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
    
    back.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30).isActive  = true
    back.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true

    
}

    
    //MARK:- Private support for creating the UI Elements
    private var setupTitle : UILabel{
        let lab = UILabel()
        lab.text = "Mr. Fantastic Fox"
        lab.font = UIFont.systemFont(ofSize: 40)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.layer.cornerRadius = 10
        lab.clipsToBounds = true
        lab.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        lab.layer.shadowOffset = CGSize(width: 1, height: 1)
        lab.layer.shadowOpacity = 0.2
        lab.layer.shadowRadius = 0.1
        return lab
    
    }
    
    private var setUpProfilePic: UIImageView{
        let pic = UIImageView(image: UIImage(named: "me"))
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.contentMode = .scaleAspectFit

        return pic
    }
    
    
    private var setUpDescription: UILabel{
        let desc = UILabel()
        desc.text = "Mr. Fox, now a newspaper columnist, moves the family into a better home in the base of a tree, ignoring the warnings of his lawyer Badger about how dangerous the area is for foxes."
        desc.textAlignment = .center
        desc.numberOfLines = 0
        desc.font = UIFont.systemFont(ofSize: 14)
        desc.translatesAutoresizingMaskIntoConstraints = false

        return desc
    }
    
    
    
    
    private var makeButtonWith: ( _ title: String, _ fontSize:  Int) -> UIButton  = { title , fontSize in
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        button.setTitle(title, for: UIControlState())
        button.titleLabel?.font = .boldSystemFont(ofSize: CGFloat(fontSize))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    
    

}//End
