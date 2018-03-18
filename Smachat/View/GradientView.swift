//
//  GradientView.swift
//  Smachat
//
//  Created by Wissa Azmy on 3/1/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import UIKit

@IBDesignable  // To make it render inside the storyboard with cutom properties
class GradientView: UIView {
    
    // You must explicity set the var type(UIColor), otherwise it won't show up in the property inspector in the storyboard
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        // Makes it update automatically when colors change from the storyboard properties
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet { self.setNeedsLayout() }
    }
    
    // This is called whenever one of the variables above change inside the setNeedsLayout()
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        // Pass the top and bottom colors to create the gradient layer
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        // Insert the layer inside the UIView itself at layer 0 to make it the first one
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
