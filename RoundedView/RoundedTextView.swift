//
//  RoundedTextView.swift
//  RoundedView
//
//  Created by Tony Monckton on 05/02/2018.
//  Copyright © 2018 Tony Monckton. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundedTextView: UITextView {
    
    @IBInspectable var cornerRadius: CGFloat            = 5.0
    @IBInspectable var fillColor: UIColor               = UIColor.gray
    @IBInspectable var borderColor: UIColor             = UIColor.black
    @IBInspectable var borderWidth: CGFloat             = 0.5
    @IBInspectable var borderOpacity: CGFloat           = 0.1
    @IBInspectable var shadowOffset: Int                = 1
    @IBInspectable var customBackgroundColor: UIColor = UIColor.clear
    
    var shapeLayer: CAShapeLayer!
/*
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
*/
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = customBackgroundColor
        
        if shapeLayer == nil {
            shapeLayer = CAShapeLayer()
            
            let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            shapeLayer.path        = path.cgPath
            shapeLayer.lineWidth   = borderWidth
            shapeLayer.strokeColor = borderColor.cgColor
            shapeLayer.fillColor   = fillColor.cgColor
            borderColor.setStroke()
            layer.addSublayer(shapeLayer)
        }
    }
}

