//
//  SolarSystemVC.swift
//
//  Created by Manuel Lopes on 12/05/16.



import UIKit

class SolarSystemVC: UIViewController{

    var initialConstraints: [NSLayoutConstraint]   = []
    var portraitConstraints: [NSLayoutConstraint]  = []
    
    // Closure to create the planets
    lazy var makePlanet : (String) -> UIImageView = { p in
        
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: p)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        return imageView
    }
    
    
    
    // Closure to creater initial constrainst
    
   lazy var initialPosition: ([UIImageView]) -> [NSLayoutConstraint] = { planetList in
        var constraints: [NSLayoutConstraint] = []
            for planet in planetList{
                let planetX = planet.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                let planetY = planet.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                planetX.isActive = true
                planetY.isActive = true
                constraints.append(planetX)
                constraints.append(planetY)
            }
        return constraints
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        let layoutGuide:UILayoutGuide = UILayoutGuide()
        
        let screenWidth = UIScreen.main.bounds.width
        let tap = UITapGestureRecognizer(target: self, action: #selector(SolarSystemVC.tapAction(_:) ))
   
        
        let earth   = makePlanet( "Earth"  )
        let mars    = makePlanet( "Mars"   )
        let uranus  = makePlanet( "Uranus" )
        let saturn  = makePlanet( "Saturn" )
        let mercury = makePlanet( "Mercury")
        let jupiter = makePlanet( "Jupiter")
      

        
        // add the layout guide to the view
        view.addLayoutGuide(layoutGuide)
        
        view.addGestureRecognizer(tap)
        
   // setupa layoutguide for the center of the screen
       layoutGuide.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       layoutGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        

    // add initial constraints to position planets in the center of the screen
        initialConstraints = initialPosition( [ earth, jupiter, mars, uranus, saturn, mercury ] )
        
        
     // create the constraits for the planets position (where they will be when the animation finishes )
        let expandedMercuryX = mercury.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let expandedMercuryY = mercury.widthAnchor.constraint(equalToConstant: 40)
        

        let expandedMarsX = mars.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor, constant: -(screenWidth / 4))
        let expandedMarsY = mars.topAnchor.constraint(equalTo: mercury.bottomAnchor, constant: -30)
        let expandedMArsWidth = mars.widthAnchor.constraint(equalToConstant: 60)
        
        
        
        let expandedEarthX = earth.leadingAnchor.constraint(equalTo: mars.trailingAnchor, constant: -25)
        let expandedEarthY = earth.topAnchor.constraint(equalTo: mars.bottomAnchor,constant: -10)
        let expandedEarthWidth = earth.widthAnchor.constraint(equalToConstant: 85)
        
        
        let expandedJupiterX = jupiter.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor)
        let expandedJupiterY = jupiter.centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor,constant: 30)
        
        let expandedSaturnX = saturn.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor, constant: (screenWidth / 4))
        let expandedSaturnY = saturn.bottomAnchor.constraint(equalTo: uranus.topAnchor, constant: 20)
      
        
        let expandedUranusX = uranus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let expandedUranusY = uranus.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let expandedUranusWidth = uranus.widthAnchor.constraint(equalToConstant: 45)

        // place the constraints in an array
        portraitConstraints = [expandedMercuryX,
                expandedMercuryY,
                
                expandedMarsX,
                expandedMarsY,
                expandedMArsWidth,
                
                expandedEarthX,
                expandedEarthY,
                expandedEarthWidth,
                
                expandedJupiterX,
                expandedJupiterY,
                
                expandedSaturnX,
                expandedSaturnY,
                
               
                expandedUranusWidth,
                expandedUranusX,
                expandedUranusY  ]

    }
    
    
    
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
         self.view.layoutIfNeeded()
        coordinator.animate(alongsideTransition:
            { _ in
            // nothing happens while rotating  
            }, completion:
                    { _ in
                        UIView.animate(withDuration: 1.5, animations:
                            {
                                NSLayoutConstraint.deactivate(self.portraitConstraints)
                                NSLayoutConstraint.activate(self.initialConstraints)
                                self.view.layoutIfNeeded()
                        })
                    }
        )
    }

    
    
    
    func tapAction(_ gesture: UIGestureRecognizer){
        // deactive the initial constraints
        NSLayoutConstraint.deactivate(self.initialConstraints)
        
        // activate each new constraint
        for i in self.portraitConstraints{ i.isActive = true   }
        
        UIView.animate(
            withDuration: 2.0,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 2,
            options: UIViewAnimationOptions(),
            animations: {
               // add and animate the new constraints
                NSLayoutConstraint.activate(self.portraitConstraints)
                self.view.layoutIfNeeded()
            },
            completion: nil
        )

        
    }
    
    override var prefersStatusBarHidden: Bool { return true  }
    
    
    
}// End

