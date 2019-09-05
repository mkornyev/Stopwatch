//
//  UIButtonShake.swift
//  Stopwatch
//
//  Created by Max Kornyev on 8/30/19.
//  Copyright © 2019 Max Kornyev. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
  
  func shake() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.95
    pulse.toValue = 1.0
    pulse.repeatCount = 0
    pulse.initialVelocity = 0.2
    pulse.damping = 1.0
    
    layer.add(pulse, forKey: nil)
  }
  
  func slideLeft() {
    let slideLeft = CABasicAnimation(keyPath: "position")
    slideLeft.duration = 0.2
    
    let fromPoint = CGPoint(x: center.x - 5, y: center.y)
    let fromVal = NSValue(cgPoint: fromPoint)
    
    slideLeft.fromValue = fromVal
    
    layer.add(slideLeft, forKey: nil)
  }
}
