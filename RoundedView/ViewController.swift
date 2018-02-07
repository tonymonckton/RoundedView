//
//  ViewController.swift
//  RoundedView
//
//  Created by Tony Monckton on 01/02/2018.
//  Copyright © 2018 Tony Monckton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundedImageView1: RoundedImageView!
    @IBOutlet weak var roundedImageView2: RoundedImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if roundedImageView1 != nil {
            roundedImageView1.test()
            print ("roundedImageView1", traitCollection.horizontalSizeClass)
        }
        
        if roundedImageView2 != nil {
        }
        
        print ("ScreenWidth", screenWidth)
        print ("screenHeight", screenHeight)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
        case (.regular, .regular):
            print("setupRegularRegular()")            
        case (.compact, .compact):
            print("setupCompactCompact()")
            
        case (.regular, .compact):
            print("setupRegularCompact()")
            
        case (.compact, .regular):
            print("setupCompactRegular()")
            
        default: break
        }
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}


