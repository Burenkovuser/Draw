//
//  CreateimageViewController.swift
//  Draw
//
//  Created by Vasilii on 24.10.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

import UIKit

class CreateimageViewController: UIViewController {

    @IBOutlet weak var imadeView: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imadeView.image = createImage()
    }
    
    
    //MARK
    func createImage() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(imadeView.frame.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        drawGradientOfSize(imadeView.frame.size, context: context)
        
        drawRadialGradientOfSize(imadeView.frame.size, context: context)
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    func drawGradientOfSize(size:CGSize, context: CGContextRef) {
        
        let colors = [
            UIColor.redColor().CGColor,
            UIColor.orangeColor().CGColor,
            UIColor.yellowColor().CGColor,
            UIColor.greenColor().CGColor
            ]
        
        let positions:[CGFloat]   = [0.2, 0.4, 0.6, 0.9]
        let startPoint  = CGPointMake(10, 10)
        let finishPoint = CGPointMake(size.width, size.height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        
        let gradient = CGGradientCreateWithColors(colorSpace, colors, positions)
        
        CGContextDrawLinearGradient(context, gradient, startPoint, finishPoint, [])
        
    }
    
    func drawRadialGradientOfSize(size: CGSize, context: CGContextRef) {
        
        let clipPath = UIBezierPath(roundedRect: CGRectMake(40, 40, size.width/2, size.width/1.5), byRoundingCorners: [.BottomLeft, .TopRight], cornerRadii: CGSizeMake(10, 10))
        
        clipPath.addClip()
        
        let colors = [
            UIColor.blackColor().CGColor,
            UIColor.whiteColor().CGColor,
            UIColor.purpleColor().CGColor,
            UIColor.greenColor().CGColor
        ]
        
        let positions:[CGFloat]   = [0.2, 0.4, 0.6, 0.9]
        let startPoint  = CGPointMake(10, 10)
        let finishPoint = CGPointMake(size.width, size.height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        
        let gradient = CGGradientCreateWithColors(colorSpace, colors, positions)
        
        CGContextDrawRadialGradient(context, gradient, startPoint, 10, finishPoint, 100, [])
        
    }
    
}




