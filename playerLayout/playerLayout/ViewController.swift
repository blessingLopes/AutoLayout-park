//
//  ViewController.swift
//  playerLayout
//
//  Created by Manuel Lopes on 09/05/16.

//

import UIKit

class PlayerViewController: UIViewController {
    
    var mainStack: UIStackView = UIStackView()
    var screenHeight: CGFloat { return UIScreen.mainScreen().bounds.height}
    var screenWidth: CGFloat {return UIScreen.mainScreen().bounds.width}
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupStackViews()
    }
    
    
    // MARK:- Private Convenience Methods
    
    private  func setupViewController(){

    }
    
    
    private func makeButtonWithTitle(title: String,  fontSize: Int) -> UIButton {
        let button = UIButton(type: .System)
        button.backgroundColor = .redColor()
        button.tintColor = .blackColor()
        button.setTitle(title, forState: .Normal)
        button.titleLabel?.font = .boldSystemFontOfSize(CGFloat(fontSize))
        return button
    }
    
    
    
    
    private func setupStackViews(){
        
        
        // The Album Cover Art ImageView
        
        let albumPic = UIImageView(image: UIImage(named: "hail")!)
        albumPic.contentMode = .ScaleAspectFill
        albumPic.clipsToBounds = true
        // make the album art stay above the controlls during rotation animation
        albumPic.layer.zPosition  = 1.0
        
        
        
       /* ---------------------------------------------------------------------------*/
        // Horizontal stackView that olds the two time stamps for the track
        
        
        let at = UITextView()
        at.text = "0:34"
        at.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        at.backgroundColor = .redColor()
        at.textAlignment = .Left
        at.editable = false

        
        let trackTime = UITextView()
        trackTime.text = "-3:19"
        trackTime.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        trackTime.backgroundColor = .redColor()
        trackTime.textAlignment = .Right
        trackTime.editable = false


        let leftDummyView = UIView()
        leftDummyView.backgroundColor = .redColor()

        let rightDummyView = UIView()
         rightDummyView.backgroundColor = .redColor()

        
        let timeStack = UIStackView(arrangedSubviews: [leftDummyView, at ,trackTime, rightDummyView ])
        
       
        leftDummyView.widthAnchor.constraintEqualToConstant(20).active = true
        rightDummyView.widthAnchor.constraintEqualToConstant(20).active = true
        at.widthAnchor.constraintEqualToAnchor(trackTime.widthAnchor).active = true
        
        
        
       
       /* ---------------------------------------------------------------------------*/
         // Horizontal stackView that holds the Previous - Play - Next buttons
        
        let back = makeButtonWithTitle("<<", fontSize: 14)
        let play = makeButtonWithTitle(" ▶︎ ", fontSize: 22)
        let forward = makeButtonWithTitle(">>", fontSize: 14)
        let love = makeButtonWithTitle("♡", fontSize: 20)
        let trackList = makeButtonWithTitle("⚡︎", fontSize: 20)
        
        let playerStack = UIStackView(arrangedSubviews: [love, back, play, forward, trackList])
        playerStack.distribution = .Fill

        
        play.widthAnchor.constraintEqualToAnchor(back.widthAnchor, multiplier: 2.0, constant: 1.0).active = true
        back.widthAnchor.constraintEqualToAnchor(forward.widthAnchor).active = true
        love.widthAnchor.constraintEqualToAnchor(back.widthAnchor).active = true
        trackList.widthAnchor.constraintEqualToAnchor(back.widthAnchor).active = true
      
         /* ---------------------------------------------------------------------------*/
        // Vertical StackView holding the Album Title and track title
        
        
        let albumTitle = UITextView()
        albumTitle.text = "Hail to the Thief"
        albumTitle.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        albumTitle.backgroundColor = .redColor()
        albumTitle.textAlignment = .Center
        albumTitle.editable = false

        
        let trackTitle = UITextView()
        trackTitle.text = "2+2 = 5"
        trackTitle.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        trackTitle.backgroundColor = .redColor()
        trackTitle.textAlignment = .Center
        trackTitle.editable = false
        
        
        let titlesStack = UIStackView(arrangedSubviews: [ albumTitle, trackTitle ])
        titlesStack.axis = .Vertical
        titlesStack.distribution = UIStackViewDistribution.FillEqually
    
  /* ---------------------------------------------------------------------------*/
        // Horizontal stackView holding the Bottom buttons
        
        let exit = makeButtonWithTitle("⍦", fontSize: 14)
        let snooze = makeButtonWithTitle(" ⏏ ", fontSize: 20)
        let speed = makeButtonWithTitle("1 x", fontSize: 14)
    
        
        let footerStack = UIStackView(arrangedSubviews: [exit, snooze, speed])
        footerStack.distribution = .Fill

        
        snooze.widthAnchor.constraintEqualToAnchor(exit.widthAnchor, multiplier: 2.0, constant: 1.0).active = true
        speed.widthAnchor.constraintEqualToAnchor(exit.widthAnchor).active = true

        
        
 /* ---------------------------------------------------------------------------*/
        // Horizontal StackView holding the Volume Slider
        
        
        let sliderDemo = UISlider()
        sliderDemo.minimumValue = 0
        sliderDemo.maximumValue = 50
        sliderDemo.continuous = true
        sliderDemo.tintColor = .blackColor()
        sliderDemo.value = 40
        sliderDemo.contentMode = .ScaleAspectFill
        sliderDemo.clipsToBounds = true
        sliderDemo.backgroundColor = .redColor()
        sliderDemo.maximumTrackTintColor = .redColor()
        sliderDemo.thumbTintColor = .blackColor()
       
        
        let leftSliderDummyView = UIView()
        leftSliderDummyView.backgroundColor = .redColor()
        
        let rightSliderDummyView = UIView()
        rightSliderDummyView.backgroundColor = .redColor()

  
        let sliderStack = UIStackView(arrangedSubviews: [ leftSliderDummyView, sliderDemo, rightSliderDummyView])
        sliderStack.axis = .Horizontal


        leftSliderDummyView.widthAnchor.constraintEqualToConstant(40).active = true
        rightSliderDummyView.widthAnchor.constraintEqualToConstant(40).active = true

        
        /* ---------------------------------------------------------------------------*/
        
        // Vertical StackView with ALL the previous controlls stacks
        
         let controlls = UIStackView(arrangedSubviews: [ timeStack,  titlesStack, playerStack, sliderStack ,footerStack ])
         controlls.axis = .Vertical
         controlls.distribution = UIStackViewDistribution.FillEqually

        
    
        /* ---------------------------------------------------------------------------*/
        
        //Vertical StackView with the Album Picture and the stackView of Controls
        
        mainStack = UIStackView(arrangedSubviews: [ albumPic, controlls ])
        mainStack.axis = .Vertical
        mainStack.spacing = 2
        mainStack.distribution = UIStackViewDistribution.FillEqually
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        
        view.addSubview(mainStack)
        

    }
    
    
    // MARK:- Handle Device Rotation
    override func viewWillTransitionToSize( size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransitionToSize(size , withTransitionCoordinator: coordinator)
    
        coordinator.animateAlongsideTransition({
            context in
            
                if size.width > size.height { self.mainStack.axis = .Horizontal   }
                else {   self.mainStack.axis = .Vertical  }
  
            }, completion: nil        )
    }
    
    
    
    
    
    //MARK:- apply constraints to the main Stack view
    override func updateViewConstraints() {
        
        let margins = view.layoutMarginsGuide
        
        mainStack.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor,constant: -20 ).active = true
        mainStack.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 20).active = true
        mainStack.topAnchor.constraintEqualToAnchor(margins.topAnchor,constant: 0).active = true
        mainStack.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor).active = true

        super.updateViewConstraints()
    }
    
    
    //MARK:- Status bar preferences
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}// END
