//
//  SmileView.swift
//  Draw
//
//  Created by Vasilii on 23.10.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

import UIKit

@IBDesignable
class SmileView: UIView {
    
    @IBInspectable var smileBackgroundColor:UIColor = UIColor.yellowColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var conoturLineColor:UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var conturLineWigth:CGFloat = 2 {
        didSet {
            setNeedsDisplay()
        }
    }

  
    override func drawRect(rect: CGRect) {
        
        drawBackground(rect)
        drawEyes(rect)
        
       
    }
    
    func drawBackground(rect:CGRect) {
        
        
        let backgraundRect = CGRectInset(rect, conturLineWigth/2, conturLineWigth/2)
        
        let backgroundPath = UIBezierPath(ovalInRect: backgraundRect)
        
        
        backgroundPath.lineWidth = conturLineWigth
        
        conoturLineColor.setStroke()
        smileBackgroundColor.setFill()
        
        
        backgroundPath.fill()
        backgroundPath.stroke()
    }
    func drawEyes(rect:CGRect) {
        
    }

}
