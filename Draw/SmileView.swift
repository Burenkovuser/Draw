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
    
    @IBInspectable var noseColor: UIColor = UIColor.redColor()
    
    @IBInspectable var happiness: CGFloat = 1 {
        didSet {
            if happiness < -1 {
                happiness = -1
            }
            if happiness > 1 {
                happiness = 1
            }
            setNeedsDisplay()
        }
    }

  
    override func drawRect(rect: CGRect) {
        
        
        drawBackground(rect)
        drawEyes(rect)
        drowNose(rect)
        drowMouth(rect)
       
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
        
        var betweenEyesPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        
        betweenEyesPoint.y -= CGRectGetHeight(rect) / 6.0
        
        let eyeShft = CGRectGetWidth(rect) / 5.5
        
        let leftEyePoint = CGPointMake(betweenEyesPoint.x - eyeShft, betweenEyesPoint.y)
        let righEeyPoint = CGPointMake(betweenEyesPoint.x + eyeShft, betweenEyesPoint.y)
        
        drawEyeIn(leftEyePoint)
        drawEyeIn(righEeyPoint)
        
        
    }
    
    func drawEyeIn(point: CGPoint) {
        let eyeSize = CGRectGetWidth(bounds) / 12
        
        conoturLineColor.setStroke()
        UIColor.whiteColor().setFill()
        
        let eyePath = UIBezierPath(arcCenter: point, radius: eyeSize,
            startAngle: 0,
            endAngle: CGFloat(2.0 * M_PI),
            clockwise: true)
        
        eyePath.lineWidth = conturLineWigth
        
        eyePath.fill()
        eyePath.stroke()
    }
    
    func drowNose(rect: CGRect) {
        
        let path = UIBezierPath()
        path.lineJoinStyle = .Round
        
        let noseWidth = CGRectGetWidth(rect) / 10
        
        var noseSrart = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        noseSrart.y = CGFloat(noseSrart.y - noseWidth / 2)
        
        var  leftNosePoint = noseSrart
        leftNosePoint.x = leftNosePoint.x - noseWidth / 2
        leftNosePoint.y = leftNosePoint.y + noseWidth
        
        
        var rightNosePoint = leftNosePoint
        rightNosePoint.x = rightNosePoint.x + noseWidth
        
        path.moveToPoint(noseSrart)
        path.addLineToPoint(leftNosePoint)
        path.addLineToPoint(rightNosePoint)
        path.closePath()
        
        conoturLineColor.setStroke()
        noseColor.setFill()
        
        path.fill()
        path.stroke()
    }
    
    func drowMouth(rect: CGRect) {
        
        var mouthSymetricPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        
        let mouthWidth = CGRectGetWidth(rect) / 4
        mouthSymetricPoint.y = mouthSymetricPoint.y + mouthWidth
        
        var leftPoint = mouthSymetricPoint
        leftPoint.x = leftPoint.x - mouthWidth / 2
        
        var rightPoint = leftPoint
        rightPoint.x =  rightPoint.x + mouthWidth
        
        var controlPoint = mouthSymetricPoint
        
        controlPoint.y = controlPoint.y + mouthWidth / 2 * happiness
        
        let path = UIBezierPath()
        
        path.lineJoinStyle = .Round
        path.lineCapStyle = .Round
        path.lineWidth = conturLineWigth
        path.moveToPoint(leftPoint)
        path.addQuadCurveToPoint(rightPoint, controlPoint: controlPoint)
        
        path.closePath()
        
        UIColor.whiteColor().setFill()
        
        path.fill()
        path.stroke()
        
    }

}
