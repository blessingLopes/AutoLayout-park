//
//  ViewController.swift
//  calculatorLayout
//
//  Created by Manuel Lopes on 12/05/16.



//TODO:-  Fix Xcode constraint warnings


import UIKit

class CalculatorViewController: UIViewController {
    //MARK:- Properties
    private var simpleCalcStack: UIStackView?

    
    //MARK:- Convenience Closures 
    
    // Closures to build buttons
    private  var createButtonWithText:(String) -> UIButton = { name   in
        
        // NOTE:- WorkAround To prevent the button's text from disapearing when the rotation from lanscape to Portrait begins:
        //  - Create a .Custom type uibutton
        //  - Replace the text with a UIimage. The image will stay on at all times.
        let button   = UIButton(type: .custom)
        //  button.setImage(image, forState: .Normal)

        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        button.setTitle(name, for: [])
        button.backgroundColor = .lightGray()
        button.tintColor = UIColor.white()
        return button
    }
    
    
    private  var createAdvButtonWithText:(String) -> UIButton = { name   in
        
        let button   = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 15)
        button.setTitle(name, for: [ ])
        button.backgroundColor = UIColor(white: 0.5, alpha: 1.0)
        button.tintColor = .white()
        return button
    }
    

    //MARK:- View life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray()
        buildSimpleCalc()
        view.addSubview(simpleCalcStack ?? UIStackView())
        

    }
    
    // MARK:- Handle Device Rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransition(to: size , with: coordinator)
        
        coordinator.animate(alongsideTransition: {
            context in
            
            if size.width > size.height {
                self.simpleCalcStack?.arrangedSubviews[0].isHidden = false
            }
            else {
                 self.simpleCalcStack?.arrangedSubviews[0].isHidden = true
            }
            
            }, completion: nil)
    }
    
    
    override func viewWillLayoutSubviews() {
        simpleCalcStack?.frame = view.bounds
    }
    
    
  // MARK:- Build and layout the simple calculator
    private func  buildSimpleCalc(){
    
        let sizeHeight = UIScreen.main().bounds.height
   
        
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
        textView.textColor = .white()
        textView.textAlignment = .right
        
        let textHostView = UIView(frame: .zero)
        textHostView.backgroundColor = .darkGray()
        textHostView.translatesAutoresizingMaskIntoConstraints = false
        textHostView.addSubview(textView)

        
       textView.bottomAnchor.constraint(equalTo: textHostView.bottomAnchor, constant: -5).isActive = true
       textView.centerXAnchor.constraint(equalTo: textHostView.centerXAnchor).isActive = true
     
        
        let firstRow = UIStackView(arrangedSubviews: [equalButton, dotButton, zeroButton ])
        firstRow.distribution = .fillProportionally
        firstRow.spacing = 0.5
        
        zeroButton.widthAnchor.constraint(equalTo: dotButton.widthAnchor, multiplier: 2.0, constant: 0.5).isActive = true
        dotButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor).isActive = true
        
        let secondRow = UIStackView(arrangedSubviews: [ plusButton, threeButton, twoButton, oneButton ])
        secondRow.distribution = .fillEqually
        secondRow.spacing = 0.5
        
        let thirdRow = UIStackView(arrangedSubviews: [minusButton, sixButton, fiveButton, fourButton ])
        thirdRow.distribution = .fillEqually
        thirdRow.spacing = 0.5
        
        let fourthRow = UIStackView(arrangedSubviews: [timesButton, nineButton, eighyButton, sevenButton ])
        fourthRow.distribution = .fillEqually
        fourthRow.spacing = 0.5
        
        let fifthRow = UIStackView(arrangedSubviews: [divideButton, closeParenthesesButton, openParenthesesButton, tanButton ])
        fifthRow.distribution = .fillEqually
        fifthRow.spacing = 0.5
        
        let buttonStackView = UIStackView(arrangedSubviews: [fifthRow, fourthRow, thirdRow, secondRow, firstRow])
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 0.5
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false

        
        let simpleCalc = UIStackView(arrangedSubviews: [textHostView, buttonStackView])
        simpleCalc.axis = .vertical
        simpleCalc.spacing = 0.5

       
        simpleCalcStack = UIStackView(arrangedSubviews: [ buildAdvancedCalcStack() , simpleCalc])
        simpleCalcStack?.axis = .horizontal
        simpleCalcStack?.spacing = 0.5
        simpleCalcStack?.distribution = .fillEqually
        simpleCalcStack?.arrangedSubviews[0].isHidden = true


        textHostView.heightAnchor.constraint(equalToConstant: sizeHeight / 4).isActive = true
        
        
    }
    
      // MARK:- Build and layout the Advanced calculator
    private func buildAdvancedCalcStack() -> UIStackView{
    
        let sizeHeight = UIScreen.main().bounds.height
    
        let dotButton   = createAdvButtonWithText("sinh")
        let equalButton = createAdvButtonWithText("cosh")
        let oneButton   = createAdvButtonWithText("tanh")
        let twoButton   = createAdvButtonWithText("x!")
        let threeButton = createAdvButtonWithText("sin")
        let plusButton  = createAdvButtonWithText("cos")
        let fourButton  = createAdvButtonWithText("tan")
        let fiveButton  = createAdvButtonWithText("e")
        let sixButton   = createAdvButtonWithText("EE")
        let minusButton = createAdvButtonWithText("log")
        let sevenButton = createAdvButtonWithText("mc")
        let eighyButton = createAdvButtonWithText("m+")
        let nineButton  = createAdvButtonWithText("10")
        let timesButton = createAdvButtonWithText("↓")
        let tanButton   = createAdvButtonWithText("Ce")
        
        let openParenthesesButton = createAdvButtonWithText("+/-")
        let closeParenthesesButton = createAdvButtonWithText("%")
        let divideButton = createAdvButtonWithText("÷")

        let symbol = createButtonWithText("m-")
        let symbol2 = createButtonWithText("m+")
        let symbol3  = createButtonWithText("10")
        let symbol4 = createButtonWithText("↓")

        
        let textHostView = UIView(frame: .zero)
        textHostView.backgroundColor = .darkGray()
        textHostView.translatesAutoresizingMaskIntoConstraints = false

        
        let firstRow = UIStackView(arrangedSubviews: [equalButton, dotButton ])
        firstRow.distribution = .fillEqually
        firstRow.spacing = 0.5
        
        dotButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor).isActive = true
        
        let secondRow = UIStackView(arrangedSubviews: [ plusButton, threeButton, twoButton, oneButton, symbol ])
        secondRow.distribution = .fillEqually
        secondRow.spacing = 0.5
        
        let thirdRow = UIStackView(arrangedSubviews: [minusButton, sixButton, fiveButton, fourButton, symbol2 ])
        thirdRow.distribution = .fillEqually
        thirdRow.spacing = 0.5
        
        let fourthRow = UIStackView(arrangedSubviews: [timesButton, nineButton, eighyButton, sevenButton, symbol3 ])
        fourthRow.distribution = .fillEqually
        fourthRow.spacing = 0.5
        
        let fifthRow = UIStackView(arrangedSubviews: [divideButton, closeParenthesesButton, openParenthesesButton, tanButton, symbol4 ])
        fifthRow.distribution = .fillEqually
        fifthRow.spacing = 0.5

        
        let buttonStackView = UIStackView(arrangedSubviews: [fifthRow, fourthRow, thirdRow, secondRow, firstRow])
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 0.5

        
        
        let advancedCalc = UIStackView(arrangedSubviews: [textHostView, buttonStackView])
        advancedCalc.axis = .vertical
        advancedCalc.spacing = 0.5

        textHostView.heightAnchor.constraint(equalToConstant: sizeHeight / 4).isActive = true
        
        return advancedCalc
    }
    
  

    override func prefersStatusBarHidden() -> Bool {
        return false
    }


}//End

