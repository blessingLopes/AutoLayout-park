//
//  SolarSystemVC.swift
//
//  Created by Manuel Lopes on 12/05/16.



import UIKit

class SolarSystemVC: UIViewController{

    var initialConstraints: [NSLayoutConstraint]   = []
    var portraitConstraints: [NSLayoutConstraint]  = []
    
    // Closure to create the planets
    lazy var makePlanet : String -> UIImageView = { p in
        
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: p)
        imageView.contentMode = .ScaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        return imageView
    }
    
    
    
    // Closure to creater initial constrainst
    
   lazy var initialPosition: [UIImageView] -> [NSLayoutConstraint] = { planetList in
        var constraints: [NSLayoutConstraint] = []
            for planet in planetList{
                let planetX = planet.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
                let planetY = planet.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
                planetX.active = true
                planetY.active = true
                constraints.append(planetX)
                constraints.append(planetY)
            }
        return constraints
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blackColor()
        let layoutGuide:UILayoutGuide = UILayoutGuide()
        
        let sizeWidth = UIScreen.mainScreen().bounds.width
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
       layoutGuide.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
       layoutGuide.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        
        

    // add initial constraints to position planets in the center of the screen
        initialConstraints = initialPosition( [ earth, jupiter, mars, uranus, saturn, mercury ] )
        
        
     // create the constraits for the planets position (where they will be when the animation finishes )
        let expandedMercuryX = mercury.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 10)
        let expandedMercuryY = mercury.widthAnchor.constraintEqualToConstant(40)
        

        let expandedMarsX = mars.centerXAnchor.constraintEqualToAnchor(layoutGuide.centerXAnchor, constant: -(sizeWidth / 4))
        let expandedMarsY = mars.topAnchor.constraintEqualToAnchor(mercury.bottomAnchor, constant: -30)
        let expandedMArsWidth = mars.widthAnchor.constraintEqualToConstant(60)
        
        
        
        let expandedEarthX = earth.leadingAnchor.constraintEqualToAnchor(mars.trailingAnchor, constant: -25)
        let expandedEarthY = earth.topAnchor.constraintEqualToAnchor(mars.bottomAnchor,constant: -10)
        let expandedEarthWidth = earth.widthAnchor.constraintEqualToConstant(85)
        
        
        let expandedJupiterX = jupiter.centerXAnchor.constraintEqualToAnchor(layoutGuide.centerXAnchor)
        let expandedJupiterY = jupiter.centerYAnchor.constraintEqualToAnchor(layoutGuide.centerYAnchor,constant: 30)
        
        let expandedSaturnX = saturn.centerXAnchor.constraintEqualToAnchor(layoutGuide.centerXAnchor, constant: (sizeWidth / 4))
        let expandedSaturnY = saturn.bottomAnchor.constraintEqualToAnchor(uranus.topAnchor, constant: 20)
      
        
        let expandedUranusX = uranus.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -20)
        let expandedUranusY = uranus.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        let expandedUranusWidth = uranus.widthAnchor.constraintEqualToConstant(45)

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
    
    
    
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
         self.view.layoutIfNeeded()
        coordinator.animateAlongsideTransition({ _ in
            
            }, completion: { _ in
                 UIView.animateWithDuration(1.5, animations: {
                    NSLayoutConstraint.deactivateConstraints(self.portraitConstraints)
                    NSLayoutConstraint.activateConstraints(self.initialConstraints)
                    self.view.layoutIfNeeded()
                 
                 })
               
        })
    }

    
    
    
    func tapAction(gesture: UIGestureRecognizer){
        // deactive the initial constraints
        NSLayoutConstraint.deactivateConstraints(self.initialConstraints)
        
        // activate each new constraint
        for i in self.portraitConstraints{ i.active = true   }
        
        UIView.animateWithDuration(
            2.0,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 2,
            options: [ .CurveEaseInOut ],
            animations: {
               // add and animate the new constraints
                NSLayoutConstraint.activateConstraints(self.portraitConstraints)
                self.view.layoutIfNeeded()
            },
            completion: nil
        )

        
    }
    
    
    
    
}// End

