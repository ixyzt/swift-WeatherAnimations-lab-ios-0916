//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    
    let stormButton = UIButton()
    
    var frameMaxXY = (CGFloat(0.0),CGFloat(0.0))
    
    var lightHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupObjects()
        animColor()
        animSunMoon()
        stormButton.isUserInteractionEnabled = true
        print(stormButton.isUserInteractionEnabled)
        print(stormButton.isEnabled)
        
    }
    
    //makes subviews and sets intiial values
    func setupObjects() {
        //create subviews
        self.view.addSubview(self.sun)
        self.view.addSubview(self.moon)
        self.view.addSubview(self.lightning)
        self.view.addSubview(self.cloud)
        
        //get coord of frame.maxX & .maxY, then set sun and moon location
        frameMaxXY = (self.view.frame.maxX, self.view.frame.maxY)
        
        self.sun.center.x = self.frameMaxXY.0 + self.frameMaxXY.0/2
        self.sun.center.y = self.frameMaxXY.1
        
        self.moon.center.x = self.frameMaxXY.0 + self.frameMaxXY.0/2
        self.moon.center.y = self.frameMaxXY.1
        
        //setup cloud
        self.cloud.frame.size.width = self.view.frame.width / 2
        self.cloud.frame.size.height = self.view.frame.height / 8
        self.cloud.center.x = self.view.center.x
        self.cloud.center.y = self.view.center.y
        self.cloud.alpha = 0.0
        
        //setup lightning
        self.lightning.frame.size.width = self.view.frame.width / 6
        self.lightning.frame.size.height = self.view.frame.height / 6
        self.lightning.center.x = self.cloud.center.x
        self.lightning.center.y = self.cloud.center.y + 100
        self.lightning.alpha = 0.0
        
        //setup stormButton
        self.stormButton.frame.size.width = CGFloat(50)
        self.stormButton.frame.size.height = CGFloat(50)
        self.stormButton.center.x = self.view.center.x
        self.stormButton.center.y = self.frameMaxXY.1 * 0.8
        self.stormButton.backgroundColor = UIColor.white
        self.stormButton.titleLabel?.textAlignment = .center
        self.stormButton.setTitle("⛈", for: .normal)
        self.stormButton.addTarget(self, action: #selector(animStorm), for: .touchUpInside)
        self.view.addSubview(self.stormButton)
        
        self.view.backgroundColor = UIColor.blue
    }
   
    func animColor() {
        UIView.animateKeyframes(withDuration: 20, delay: 0.0, options: [.repeat, .allowUserInteraction], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.1, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.1, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.1, animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.45, animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.95, relativeDuration: 0.05, animations: {
                self.view.backgroundColor = UIColor.blue
            })

            }, completion: nil)
    }
    
    func animSunMoon() {
        UIView.animateKeyframes(withDuration: 20, delay: 0.0, options: [.repeat,.allowUserInteraction], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                print("+++++Sunrise")
                self.sun.transform = CGAffineTransform(translationX: (self.sun.center.x + self.frameMaxXY.0/2) * -0.5
                    , y: self.frameMaxXY.1 * -0.8)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                print("+++++Sunset")
                self.sun.transform = CGAffineTransform(translationX: (self.sun.center.x + self.frameMaxXY.0/2) * -1
                    , y: 0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                print("+++++Moonrise")
                self.moon.transform = CGAffineTransform(translationX: (self.moon.center.x + self.frameMaxXY.0/2) * -0.5
                    , y: self.frameMaxXY.1 * -0.8)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                print("+++++Moonset")
                self.moon.transform = CGAffineTransform(translationX: (self.moon.center.x + self.frameMaxXY.0/2) * -1
                    , y: 0)

            })
            }, completion: nil)
    }
    
    func animStorm() {
        UIView.animateKeyframes(withDuration: 8, delay: 0.0, options: .allowUserInteraction, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33, animations: {
                print("Cloud In & Up")
                self.cloud.transform = CGAffineTransform(translationX: 0, y: self.frameMaxXY.1/5 * -1)
                self.lightning.transform = CGAffineTransform(translationX: 0, y: self.frameMaxXY.1/5 * -1)
                self.cloud.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.33, animations: {
                print("Cloud Down")
                self.cloud.transform = CGAffineTransform(translationX: 0, y: 0)
                self.lightning.transform = CGAffineTransform(translationX: 0, y: 0)
                self.cloud.alpha = 1.0
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.33, animations: {
                print("Cloud Up & Out")
                self.cloud.transform = CGAffineTransform(translationX: 0, y: self.frameMaxXY.1/5 * -1)
                self.lightning.transform = CGAffineTransform(translationX: 0, y: self.frameMaxXY.1/5 * -1)
                self.cloud.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.99, relativeDuration: 0.01, animations: {
                print("Cloud Up & Out")
                self.cloud.transform = CGAffineTransform(translationX: 0, y: 0)
                self.lightning.transform = CGAffineTransform(translationX: 0, y: 0)
                self.cloud.alpha = 0
            })

            }, completion: nil)
        
        UIView.animate(withDuration: 0.15, delay: 3, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
            UIView.setAnimationRepeatCount(6)
    
            switch self.lightHidden {
            case true:
                self.lightning.alpha = 1
            default:
                self.lightning.alpha = 0
                self.lightHidden = true
            }
            
            }) { completed in
                self.lightning.alpha = 0.0
        }
        
    }
}
