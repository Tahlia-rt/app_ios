//
//  Jitterable.swift
//  pr_protocol
//
//  Created by Tahlia on 11/8/16.
//  Copyright © 2016 Tahlia. All rights reserved.
//

import UIKit

protocol Jitterable {}

extension Jitterable where Self: UIView {
    
    //이동거리, 시간, 반복횟수, reverse + add
    
    func jitter(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(cgPoint: CGPoint.init(x: self.center.x-0.8, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint.init(x: self.center.x+0.8, y: self.center.y))
        animation.duration = 0.4
        animation.repeatCount = 5
        animation.autoreverses = true
        layer.add(animation, forKey: "position")
    }

}
