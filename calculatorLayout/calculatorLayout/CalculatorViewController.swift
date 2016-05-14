//
//  ViewController.swift
//  calculatorLayout
//
//  Created by Manuel Lopes on 12/05/16.


import UIKit

class CalculatorViewController: UIViewController {
    
    var simpleCalcStack: UIStackView!
    var advancedCalc: UIStackView!
    
    
    
    
    
    
    
    // closure to build buttons
    private  var createButtonWithText:String -> UIButton = { name   in
        
        let button = UIButton(type: .System)
        button.tintColor = UIColor.whiteColor()
        button.backgroundColor = UIColor(white: 0.38, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        button.setTitle(name, forState: .Normal)
        return button
        
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        buildSimpleCalc()
        
        view.addSubview(simpleCalcStack)
        

    }
    
    // MARK:- Handle Device Rotation
    override func viewWillTransitionToSize( size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransitionToSize(size , withTransitionCoordinator: coordinator)
        
//        let ff = self.hostStackView.arrangedSubviews[0]
        
        coordinator.animateAlongsideTransition({
            context in
            
            if size.width > size.height {
                
                self.simpleCalcStack.arrangedSubviews[0].hidden = false
    
                self.simpleCalcStack.distribution = .FillEqually
            }
            else {
//                self.simpleCalcStack.arrangedSubviews[0].widthAnchor.constraintEqualToConstant(0.0).active = true
//                self.simpleCalcStack.distribution = .FillProportionally
//                self.simpleCalcStack.baselineRelativeArrangement = false
                
              
//              self.viewWillLayoutSubviews() 
                
            }
            
            }, completion: {_ in
                

        }     )
    }
    
    
    
  
    private func  buildSimpleCalc(){
    
        let sizeHeight = UIScreen.mainScreen().bounds.height
        let sizeWidth = UIScreen.mainScreen().bounds.width
        
        let zeroButton  = createButtonWithText("0")
        let dotButton   = createButtonWithText(",")
        let equalButton = createButtonWithText("=")
        let oneButton   = createButtonWithText("1")
        let twoButton   = createButtonWithText("2")
        let threeButton = createButtonWithText("3")
        let plusButton  = createButtonWithText("+")
        let fourButton  = createButtonWithText("4")
        let fiveButton  = createButtonWithText("5")
        let sixButton   = createButtonWithText("6")
        let minusButton = createButtonWithText("−")
        let sevenButton = createButtonWithText("7")
        let eighyButton = createButtonWithText("8")
        let nineButton  = createButtonWithText("9")
        let timesButton = createButtonWithText("×")
        let tanButton   = createButtonWithText("C")
        let openParenthesesButton = createButtonWithText("+/-")
        let closeParenthesesButton = createButtonWithText("%")
        let divideButton = createButtonWithText("÷")
        
        let textView = UILabel(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "24"
        textView.font = UIFont(name: "HelveticaNeue-Thin", size: 60)
        textView.textColor = .whiteColor()
        textView.textAlignment = .Right
        
        let textHostView = UIView(frame: .zero)
        textHostView.backgroundColor = .blackColor()
        textHostView.translatesAutoresizingMaskIntoConstraints = false
        textHostView.addSubview(textView)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(textView.bottomAnchor.constraintEqualToAnchor(textHostView.bottomAnchor, constant: -5))
        constraints.append(textView.leadingAnchor.constraintEqualToAnchor(textHostView.leadingAnchor, constant: 5))
        constraints.append(textView.trailingAnchor.constraintEqualToAnchor(textHostView.trailingAnchor, constant: -5))
        
        NSLayoutConstraint.activateConstraints(constraints)
        
        
        let firstRow = UIStackView(arrangedSubviews: [equalButton, dotButton, zeroButton ])
        firstRow.distribution = .FillProportionally
        firstRow.spacing = 0.5
        
        zeroButton.widthAnchor.constraintEqualToAnchor(dotButton.widthAnchor, multiplier: 2.0, constant: 0.5).active = true
        dotButton.widthAnchor.constraintEqualToAnchor(equalButton.widthAnchor).active = true
        
        let secondRow = UIStackView(arrangedSubviews: [ plusButton, threeButton, twoButton, oneButton ])
        secondRow.distribution = .FillEqually
        secondRow.spacing = 0.5
        
        let thirdRow = UIStackView(arrangedSubviews: [minusButton, sixButton, fiveButton, fourButton ])
        thirdRow.distribution = .FillEqually
        thirdRow.spacing = 0.5
        
        let fourthRow = UIStackView(arrangedSubviews: [timesButton, nineButton, eighyButton, sevenButton ])
        fourthRow.distribution = .FillEqually
        fourthRow.spacing = 0.5
        
        let fifthRow = UIStackView(arrangedSubviews: [divideButton, closeParenthesesButton, openParenthesesButton, tanButton ])
        fifthRow.distribution = .FillEqually
        fifthRow.spacing = 0.5
        
        let buttonStackView = UIStackView(arrangedSubviews: [fifthRow, fourthRow, thirdRow, secondRow, firstRow])
        buttonStackView.axis = .Vertical
        buttonStackView.distribution = .FillEqually
        buttonStackView.spacing = 0.5
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        buttonStackView.heightAnchor.constraintEqualToConstant( 6 ).active = true
        
        
        
        
        let albumPic = UIImageView(image: UIImage(named: "mex")!)
        albumPic.contentMode = .ScaleAspectFit
        //        albumPic.clipsToBounds = true
//        albumPic.translatesAutoresizingMaskIntoConstraints = true
      
        
        
        
        
        let simpleCalc = UIStackView(arrangedSubviews: [textHostView, buttonStackView])
        simpleCalc.axis = .Vertical
//        simpleCalc.distribution = .Fill
        simpleCalc.spacing = 0.5
//        simpleCalc.hidden = true
        
        
        
         buildAdvancedCalcStack()
//        dd.baselineRelativeArrangement = true
        
       
        simpleCalcStack = UIStackView(arrangedSubviews: [ advancedCalc , simpleCalc])
        simpleCalcStack.axis = .Horizontal
        simpleCalcStack.spacing = 0.5
        simpleCalcStack.distribution = .Fill
        simpleCalcStack.arrangedSubviews[0].hidden = true
//        simpleCalcStack.baselineRelativeArrangement = true

        textHostView.heightAnchor.constraintEqualToConstant(sizeHeight / 4).active = true
        

    }
    
    
    private func buildAdvancedCalcStack(){
    
        let sizeHeight = UIScreen.mainScreen().bounds.height
//        let sizeWidth = UIScreen.mainScreen().bounds.width
        
        let zeroButton  = createButtonWithText("0")
        let dotButton   = createButtonWithText(",")
        let equalButton = createButtonWithText("=")
        let oneButton   = createButtonWithText("1")
        let twoButton   = createButtonWithText("2")
        let threeButton = createButtonWithText("3")
        let plusButton  = createButtonWithText("+")
        let fourButton  = createButtonWithText("4")
        let fiveButton  = createButtonWithText("5")
        let sixButton   = createButtonWithText("6")
        let minusButton = createButtonWithText("−")
        let sevenButton = createButtonWithText("7")
        let eighyButton = createButtonWithText("8")
        let nineButton  = createButtonWithText("9")
        let timesButton = createButtonWithText("×")
        let tanButton   = createButtonWithText("C")
        let openParenthesesButton = createButtonWithText("+/-")
        let closeParenthesesButton = createButtonWithText("%")
        let divideButton = createButtonWithText("÷")
        let duh = createButtonWithText("p")
        
        let testeLAbel = UILabel()
        testeLAbel.text = "U"
        testeLAbel.textColor = .whiteColor()
        testeLAbel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(testeLAbel)
        
        
        let textView = UILabel(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.text = "88"
        textView.font = UIFont(name: "HelveticaNeue-Thin", size: 60)
        textView.textColor = .whiteColor()
        textView.textAlignment = .Right
        eighyButton.contentMode = .ScaleAspectFit
        
        let textHostView = UIView(frame: .zero)
        textHostView.backgroundColor = .blackColor()
        textHostView.translatesAutoresizingMaskIntoConstraints = false
        textHostView.addSubview(textView)
        
        //var constraints = [NSLayoutConstraint]()
        
        textView.bottomAnchor.constraintEqualToAnchor(textHostView.bottomAnchor, constant: -5).active = true
        textView.leadingAnchor.constraintEqualToAnchor(textHostView.leadingAnchor, constant: 5).active = true
        textView.trailingAnchor.constraintEqualToAnchor(textHostView.trailingAnchor, constant: -5).active = true
        
        //NSLayoutConstraint.activateConstraints(constraints)
        
        
        let firstRow = UIStackView(arrangedSubviews: [equalButton, dotButton, testeLAbel, duh ])
        firstRow.distribution = .FillEqually
        firstRow.spacing = 0.5
        
//        zeroButton.widthAnchor.constraintEqualToAnchor(dotButton.widthAnchor, multiplier: 2.0, constant: 0.5).active = true
        dotButton.widthAnchor.constraintEqualToAnchor(equalButton.widthAnchor).active = true
        
        let secondRow = UIStackView(arrangedSubviews: [ plusButton, threeButton, twoButton, oneButton ])
        secondRow.distribution = .FillEqually
        secondRow.spacing = 0.5
        
        let thirdRow = UIStackView(arrangedSubviews: [minusButton, sixButton, fiveButton, fourButton ])
        thirdRow.distribution = .FillEqually
        thirdRow.spacing = 0.5
        
        let fourthRow = UIStackView(arrangedSubviews: [timesButton, nineButton, eighyButton, sevenButton ])
        fourthRow.distribution = .FillEqually
        fourthRow.spacing = 0.5
        
        let fifthRow = UIStackView(arrangedSubviews: [divideButton, closeParenthesesButton, openParenthesesButton, tanButton ])
        fifthRow.distribution = .FillEqually
        fifthRow.spacing = 0.5
        
        let buttonStackView = UIStackView(arrangedSubviews: [fifthRow, fourthRow, thirdRow, secondRow, firstRow])
        buttonStackView.axis = .Vertical
        buttonStackView.distribution = .FillEqually
        buttonStackView.spacing = 0.5
//        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //        buttonStackView.heightAnchor.constraintEqualToConstant( 6 ).active = true
        
   
        
        
        advancedCalc = UIStackView(arrangedSubviews: [textHostView, buttonStackView])
        advancedCalc.axis = .Vertical
//        advancedCalc.distribution = .Fill
        advancedCalc.spacing = 0.5
     
        advancedCalc.translatesAutoresizingMaskIntoConstraints = false
        
        textHostView.heightAnchor.constraintEqualToConstant(sizeHeight / 4).active = true
        
        
       
    
    
    }
    
    override func viewWillLayoutSubviews() {
        simpleCalcStack.frame = view.bounds
        advancedCalc.frame = view.bounds
        let size = UIScreen.mainScreen().bounds.size
        if size.width > size.height{
        self.simpleCalcStack.arrangedSubviews[0].hidden = false
        }else{
               view.layoutIfNeeded()
            updateViewConstraints()
         self.simpleCalcStack.arrangedSubviews[0].hidden = true
       
        }
    }

    
    
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }


}//End

