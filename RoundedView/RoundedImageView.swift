//
//  RoundedImageView.swift
//  RoundedView
//
//  Created by Tony Monckton on 03/02/2018.
//  Copyright © 2018 Tony Monckton. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundedImageView: UIView {
    
    var backgroundLayer: CAShapeLayer!
    var imageLayer: CALayer!
    var frontLayer: CAShapeLayer!
    
    @IBInspectable var ibCircle: Bool           = false
    @IBInspectable var cornerRadius: CGFloat    = 5.0
    @IBInspectable var borderWidth: CGFloat     = 0.5
    @IBInspectable var borderColor: UIColor     = UIColor.gray
    @IBInspectable var backColor: UIColor       = UIColor.gray
    @IBInspectable var shadowOffset: Int        = 1
    @IBInspectable var image: UIImage!          = nil
    
    @IBInspectable var customBackgroundColor: UIColor = UIColor.clear
/*
    override var backgroundColor: UIColor?{
        didSet {
            backgroundColor = customBackgroundColor
            super.backgroundColor = UIColor.clear
        }
    }
*/
     override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = customBackgroundColor
        print ("RoundedImageView::init:",frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        backgroundColor = customBackgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = customBackgroundColor
        setBackgroundLayer()
        setMidgroundImageLayer()
        setFrontLayer()
        setImage()
    }
    
    func setBackgroundLayer() {
        if backgroundLayer == nil {
            var path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            if ibCircle == true {
                path = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.width/2)
            }
            backgroundLayer             = CAShapeLayer()
            backgroundLayer.path        = path.cgPath
            backgroundLayer.lineWidth   = borderWidth
            backgroundLayer.fillColor   = backColor.cgColor
        
            // shadow
            backgroundLayer.shadowColor      = UIColor.black.cgColor
            backgroundLayer.shadowOffset     = CGSize(width: shadowOffset, height: shadowOffset)
            backgroundLayer.shadowRadius     = 5.0
            backgroundLayer.shadowOpacity    = 0.5
            
            layer.addSublayer(backgroundLayer)
        }
        backgroundLayer.frame = layer.bounds
    }
    
    func setMidgroundImageLayer() {
        if imageLayer == nil {
            var path        = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            if ibCircle == true {
                path = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.width/2)
            }
            let mask        = CAShapeLayer()
            mask.fillColor  = UIColor.black.cgColor
            mask.path       = path.cgPath
            mask.frame      = self.bounds
            layer.addSublayer(mask)
            
            imageLayer          = CAShapeLayer()
            imageLayer.frame    = self.bounds
            imageLayer.mask     = mask
            imageLayer.contentsGravity = kCAGravityResizeAspectFill
            layer.addSublayer(imageLayer)
        }
    }
    
    func setFrontLayer() {
        if ( frontLayer == nil ) {
            frontLayer = CAShapeLayer()
            var path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            if ibCircle == true {
                path = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.width/2)
            }
            
            frontLayer.path         = path.cgPath
            frontLayer.fillColor    = UIColor.clear.cgColor
            frontLayer.strokeColor  = borderColor.cgColor
            frontLayer.strokeStart  = CGFloat(0.0)
            frontLayer.strokeEnd    = CGFloat(1.0)
            frontLayer.lineWidth    = borderWidth
            layer.addSublayer(frontLayer)
        }
    }
    
    func setImage() {
        if let pic = image {
            if imageLayer != nil {
                imageLayer.contents = pic.cgImage
            }
        }
    }
    
    func setImage( userImage: UIImage!) {
        if imageLayer != nil {
            if let userPic: UIImage = userImage {
                imageLayer.contents = userPic.cgImage
            }
        }
    }

    func test()
    {
        print ("test")
    }
    
    // setup data of IB
    override func prepareForInterfaceBuilder() {
    
    }
    
    override func draw(_ rect: CGRect) {
    }
}
