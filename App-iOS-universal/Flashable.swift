//
//  Flashable.swift
//  pr_protocol
//
//  Created by Tahlia on 11/8/16.
//  Copyright © 2016 Tahlia. All rights reserved.
//

import UIKit

protocol Flashable {}

extension Flashable where Self: UIView {
 
    func flash(){
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 1.0 }, completion: {
                animationComplete in
                if animationComplete == true{
                    UIView.animate(withDuration: 1.5, delay: 0.8, options: .curveEaseOut, animations: {
                        self.alpha = 0.0
                    }, completion: nil)
                }
        })
    }

}
