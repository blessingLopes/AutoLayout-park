//
//  ViewController.swift
//  playerLayout
//
//  Created by Manuel Lopes on 09/05/16.

//

import UIKit

class PlayerViewController: UIViewController {
    
    var mainStack: UIStackView = UIStackView()
    var screenHeight: CGFloat { return UIScreen.main.bounds.height}
    var screenWidth: CGFloat {return UIScreen.main.bounds.width}
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupStackViews()
    }
    
    
    // MARK:- Private Convenience Methods
    
    private  func setupViewController(){

    }
    
    
    private func makeButtonWithTitle(_ title: String,  fontSize: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.tintColor = .black
        button.setTitle(title, for: UIControlState())
        button.titleLabel?.font = .boldSystemFont(ofSize: CGFloat(fontSize))
        return button
    }
    
    
    
    
    private func setupStackViews(){
        
        
        // The Album Cover Art ImageView
        
        let albumPic = UIImageView(image: UIImage(named: "hail")!)
        albumPic.contentMode = .scaleAspectFill
        albumPic.clipsToBounds = true
        // make the album art stay above the controlls during rotation animation
        albumPic.layer.zPosition  = 1.0
        
        
        
       /* ---------------------------------------------------------------------------*/
        // Horizontal stackView that olds the two time stamps for the track
        
        
        let at = UITextView()
        at.text = "0:34"
        at.font = UIFont.preferredFont(forTextStyle: .caption2)
        at.backgroundColor = .red
        at.textAlignment = .left
        at.isEditable = false

        
        let trackTime = UITextView()
        trackTime.text = "-3:19"
        trackTime.font = UIFont.preferredFont(forTextStyle: .caption2)
        trackTime.backgroundColor = .red
        trackTime.textAlignment = .right
        trackTime.isEditable = false


        let leftDummyView = UIView()
        leftDummyView.backgroundColor = .red

        let rightDummyView = UIView()
         rightDummyView.backgroundColor = .red

        
        let timeStack = UIStackView(arrangedSubviews: [leftDummyView, at ,trackTime, rightDummyView ])
        
       
        leftDummyView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightDummyView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        at.widthAnchor.constraint(equalTo: trackTime.widthAnchor).isActive = true
        
        
        
       
       /* ---------------------------------------------------------------------------*/
         // Horizontal stackView that holds the Previous - Play - Next buttons
        
        let back = makeButtonWithTitle("<<", fontSize: 14)
        let play = makeButtonWithTitle(" ▶︎ ", fontSize: 22)
        let forward = makeButtonWithTitle(">>", fontSize: 14)
        let love = makeButtonWithTitle("♡", fontSize: 20)
        let trackList = makeButtonWithTitle("⚡︎", fontSize: 20)
        
        let playerStack = UIStackView(arrangedSubviews: [love, back, play, forward, trackList])
        playerStack.distribution = .fill

        
        play.widthAnchor.constraint(equalTo: back.widthAnchor, multiplier: 2.0, constant: 1.0).isActive = true
        back.widthAnchor.constraint(equalTo: forward.widthAnchor).isActive = true
        love.widthAnchor.constraint(equalTo: back.widthAnchor).isActive = true
        trackList.widthAnchor.constraint(equalTo: back.widthAnchor).isActive = true
      
         /* ---------------------------------------------------------------------------*/
        // Vertical StackView holding the Album Title and track title
        
        
        let albumTitle = UITextView()
        albumTitle.text = "Hail to the Thief"
        albumTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        albumTitle.backgroundColor = .red
        albumTitle.textAlignment = .center
        albumTitle.isEditable = false

        
        let trackTitle = UITextView()
        trackTitle.text = "2+2 = 5"
        trackTitle.font = UIFont.preferredFont(forTextStyle: .footnote)
        trackTitle.backgroundColor = .red
        trackTitle.textAlignment = .center
        trackTitle.isEditable = false
        
        
        let titlesStack = UIStackView(arrangedSubviews: [ albumTitle, trackTitle ])
        titlesStack.axis = .vertical
        titlesStack.distribution = UIStackViewDistribution.fillEqually
    
  /* ---------------------------------------------------------------------------*/
        // Horizontal stackView holding the Bottom buttons
        
        let exit = makeButtonWithTitle("⍦", fontSize: 14)
        let snooze = makeButtonWithTitle(" ⏏ ", fontSize: 20)
        let speed = makeButtonWithTitle("1 x", fontSize: 14)
    
        
        let footerStack = UIStackView(arrangedSubviews: [exit, snooze, speed])
        footerStack.distribution = .fill

        
        snooze.widthAnchor.constraint(equalTo: exit.widthAnchor, multiplier: 2.0, constant: 1.0).isActive = true
        speed.widthAnchor.constraint(equalTo: exit.widthAnchor).isActive = true

        
        
 /* ---------------------------------------------------------------------------*/
        // Horizontal StackView holding the Volume Slider
        
        
        let sliderDemo = UISlider()
        sliderDemo.minimumValue = 0
        sliderDemo.maximumValue = 50
        sliderDemo.isContinuous = true
        sliderDemo.tintColor = .black
        sliderDemo.value = 40
        sliderDemo.contentMode = .scaleAspectFill
        sliderDemo.clipsToBounds = true
        sliderDemo.backgroundColor = .red
        sliderDemo.maximumTrackTintColor = .red
        sliderDemo.thumbTintColor = .black
       
        
        let leftSliderDummyView = UIView()
        leftSliderDummyView.backgroundColor = .red
        
        let rightSliderDummyView = UIView()
        rightSliderDummyView.backgroundColor = .red

  
        let sliderStack = UIStackView(arrangedSubviews: [ leftSliderDummyView, sliderDemo, rightSliderDummyView])
        sliderStack.axis = .horizontal


        leftSliderDummyView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        rightSliderDummyView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        
        /* ---------------------------------------------------------------------------*/
        
        // Vertical StackView with ALL the previous controlls stacks
        
         let controlls = UIStackView(arrangedSubviews: [ timeStack,  titlesStack, playerStack, sliderStack ,footerStack ])
         controlls.axis = .vertical
         controlls.distribution = UIStackViewDistribution.fillEqually

        
    
        /* ---------------------------------------------------------------------------*/
        
        //Vertical StackView with the Album Picture and the stackView of Controls
        
        mainStack = UIStackView(arrangedSubviews: [ albumPic, controlls ])
        mainStack.axis = .vertical
        mainStack.spacing = 2
        mainStack.distribution = UIStackViewDistribution.fillEqually
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        
        view.addSubview(mainStack)
        

    }
    
    
    // MARK:- Handle Device Rotation
    override func viewWillTransition( to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransition(to: size , with: coordinator)
    
        coordinator.animate(alongsideTransition: {
            context in
            
                if size.width > size.height { self.mainStack.axis = .horizontal   }
                else {   self.mainStack.axis = .vertical  }
  
            }, completion: nil        )
    }
    
    
    
    
    
    //MARK:- apply constraints to the main Stack view
    override func updateViewConstraints() {
        
        let margins = view.layoutMarginsGuide
        
        mainStack.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: -20 ).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 20).isActive = true
        mainStack.topAnchor.constraint(equalTo: margins.topAnchor,constant: 0).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true

        super.updateViewConstraints()
    }
    
    
    //MARK:- Status bar preferences
    
    override var preferredStatusBarStyle: UIStatusBarStyle {  return .lightContent  }
    
}// END
