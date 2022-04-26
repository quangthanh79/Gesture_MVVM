//
//  ImageViewController.swift
//  DataBinding
//
//  Created by Tuấn Phạm on 24/03/2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var viewTotal: UIView!
    @IBOutlet weak var view1: UIView!
    var unitHeight : CGFloat!
    var unitWidth : CGFloat!
    let viewParent = UIView()
    let viewParent1 = UIView()

    var origin: CGPoint!
    var viewCenter: CGPoint!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var minWidth: CGFloat!
    var minHeight: CGFloat!
    
    var unitSize : CGFloat!

    @IBOutlet weak var image: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        unitWidth  = image.frame.size.width/11
        print("unitHeight: + \(unitHeight)")
        print("unitWidth: + \(unitWidth)")
        //setViewParent()
        setSize()
        setViewParent1()
        setViewChildTopRight()
        setViewChildTopLeft()
        setViewChildBottomRight()
        setViewChildBottomLeft()
        setViewChildCenter()
    }
    private func setSize(){
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        unitSize  = screenWidth/16
        minWidth  = screenWidth/8
        minHeight = (screenWidth*9)/128
        screenHeight = screenSize.height
    }
    private func setViewParent1(){
        viewTotal.addSubview(viewParent1)
        viewParent1.layer.borderWidth = 1
        viewParent1.layer.borderColor = UIColor(netHex:0xFF4C4C).cgColor
        var getView = viewParent1.frame
        
        getView.size.width = 2*unitSize
        getView.size.height = 2*unitSize
        getView.origin.x = 2 * unitSize
        getView.origin.y =  5 * unitSize

        viewParent1.frame = getView

    }
    private func setViewChildCenter(){
        let viewChildTopRight = UIView()
        viewChildTopRight.backgroundColor = UIColor(netHex:0xFF4C4C)
        viewParent1.addSubview(viewChildTopRight)
        viewChildTopRight.translatesAutoresizingMaskIntoConstraints = false
        viewParent1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragView)))

        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .trailing, relatedBy: .equal, toItem: viewParent1, attribute: .trailing, multiplier: 1, constant: -4))
        
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .leading, relatedBy: .equal, toItem: viewParent1, attribute: .leading, multiplier: 1, constant: 4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .top, relatedBy: .equal, toItem: viewParent1, attribute: .top, multiplier: 1, constant: 4))
        
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .bottom, relatedBy: .equal, toItem: viewParent1, attribute: .bottom, multiplier: 1, constant: -4))
        
    }

    private func setViewChildTopRight(){
        let viewChildTopRight = UIImageView()
        viewChildTopRight.image = UIImage(named: "icon_top_right.pdf")
        viewChildTopRight.isUserInteractionEnabled = true
        
        viewParent1.addSubview(viewChildTopRight)
        viewChildTopRight.translatesAutoresizingMaskIntoConstraints = false
        viewChildTopRight.isUserInteractionEnabled = true
        viewChildTopRight.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerTopRightDotMoveGesture(_:))))

        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .trailing, relatedBy: .equal, toItem: viewParent1, attribute: .trailing, multiplier: 1, constant: 4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .top, relatedBy: .equal, toItem: viewParent1, attribute: .top, multiplier: 1, constant: -4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 12))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 12))
    }
    private func setViewChildBottomLeft(){
        let viewChildBottomLeft = UIImageView()
        viewChildBottomLeft.image = UIImage(named: "icon_top_right.pdf")
        viewChildBottomLeft.isUserInteractionEnabled = true
        
        viewParent1.addSubview(viewChildBottomLeft)
        viewChildBottomLeft.translatesAutoresizingMaskIntoConstraints = false
        viewChildBottomLeft.isUserInteractionEnabled = true
        viewChildBottomLeft.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerTopRightDotMoveGesture(_:))))

        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildBottomLeft, attribute: .leading, relatedBy: .equal, toItem: viewParent1, attribute: .leading, multiplier: 1, constant: -4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildBottomLeft, attribute: .bottom, relatedBy: .equal, toItem: viewParent1, attribute: .bottom, multiplier: 1, constant: 4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildBottomLeft, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 12))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildBottomLeft, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 12))
    }
    private func setViewChildTopLeft(){
        let viewChildTopLeft = UIImageView()
        viewChildTopLeft.image = UIImage(named: "top_left.pdf")
        viewChildTopLeft.isUserInteractionEnabled = true
        
        viewParent1.addSubview(viewChildTopLeft)
        viewChildTopLeft.translatesAutoresizingMaskIntoConstraints = false
        viewChildTopLeft.isUserInteractionEnabled = true
        viewChildTopLeft.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerTopRightDotMoveGesture(_:))))

        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopLeft, attribute: .leading, relatedBy: .equal, toItem: viewParent1, attribute: .leading, multiplier: 1, constant: -4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopLeft, attribute: .top, relatedBy: .equal, toItem: viewParent1, attribute: .top, multiplier: 1, constant: -4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopLeft, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 12))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildTopLeft, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 12))
    }
    private func setViewChildBottomRight(){
        let viewChildBottomRight = UIImageView()
        viewChildBottomRight.image = UIImage(named: "top_left.pdf")
        viewChildBottomRight.isUserInteractionEnabled = true
        
        viewParent1.addSubview(viewChildBottomRight)
        viewChildBottomRight.translatesAutoresizingMaskIntoConstraints = false
        viewChildBottomRight.isUserInteractionEnabled = true
        viewChildBottomRight.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerTopRightDotMoveGesture(_:))))

        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildBottomRight, attribute: .trailing, relatedBy: .equal, toItem: viewParent1, attribute: .trailing, multiplier: 1, constant: 4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildBottomRight, attribute: .bottom, relatedBy: .equal, toItem: viewParent1, attribute: .bottom, multiplier: 1, constant: 4))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildBottomRight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 12))
        viewParent1.addConstraint(NSLayoutConstraint(item: viewChildBottomRight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 12))
    }
    @objc func dragView(gesture: UIPanGestureRecognizer) {
            let target = gesture.view!
        var x: CGFloat!
        var y: CGFloat!
        
            // biến x,y kiểu tham trị
        switch gesture.state {
            case .began:
                viewCenter = target.center
                origin = target.frame.origin
                x = origin!.x
                y = origin!.y
            case .changed:
                let translation = gesture.translation(in: self.image)
                var originX_New = origin.x + translation.x
                var originY_New = origin.y + translation.y
                
                var max_OriginX = screenWidth-target.frame.width
                var max_OriginY = (screenWidth/16)*9-target.frame.height

            if(originX_New >= 0 && originY_New >= 0 &&
               originX_New <= max_OriginX && originY_New <= max_OriginY )
            
            {
                target.frame.origin = CGPoint(x: origin.x + translation.x, y: origin.y + translation.y)
            }
//            case .ended:
//                let translation = gesture.translation(in: self.image)
//
//                print("X: \(translation.x)")
//                print("Y: \(translation.y)")
//
//                print("X_before: \(origin.x + translation.x)")
//                print("Y_before: \(origin.y + translation.y)")
//                var x_before = origin.x + translation.x
//                var y_before = origin.y + translation.y
//
//
//                var check_x = x_before.truncatingRemainder(dividingBy: unitSize)
//                var check_y = y_before.truncatingRemainder(dividingBy: unitSize)
//
//                var x_after : CGFloat!
//                var y_after : CGFloat!
//                if(check_x > unitSize/2){
//                    x_after = x_before - check_x + unitSize
//                }else {
//                    x_after = x_before - check_x
//                }
//                if(check_y > unitSize/2){
//                    y_after = y_before - check_y + unitSize
//                }else {
//                    y_after = y_before - check_y
//                }
//                target.frame.origin.x = x_after
//                target.frame.origin.y = y_after
//
//
            default: break
            }
        }
    @objc func cornerBottomRightDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {

//        if(recognizer.state == .ended){
            let touchLocation = recognizer.location(in: self.viewTotal)
        print(touchLocation.x)
            var getSuperView = viewParent1.frame
            var getSuperView_Live = viewParent1.frame
            
            var oldY = getSuperView.origin.y
            var newY = touchLocation.y
            var checkY = unitSize - newY.truncatingRemainder(dividingBy: unitSize)
            var checkX = (touchLocation.x - getSuperView.origin.x).truncatingRemainder(dividingBy: unitSize)
            
            // set SuperView update
            
            if( touchLocation.x < (getSuperView_Live.origin.x + unitWidth)){

            } else {
                if(checkX > unitSize/2){
                    getSuperView.size.width = (touchLocation.x - getSuperView.origin.x) - checkX + unitSize
                } else{
                    if ( (touchLocation.x - getSuperView.origin.x) == checkX){
                        getSuperView.size.width = 10
                    }else{
                        getSuperView.size.width = (touchLocation.x - getSuperView.origin.x)  - checkX
                    }
                }
            }

            if(touchLocation.y > (getSuperView_Live.origin.y + getSuperView_Live.size.height - unitSize)){

            }else{
                if(checkY > unitSize/2){
                    getSuperView.origin.y = touchLocation.y+checkY - unitSize
                    getSuperView.size.height = getSuperView.size.height + oldY - touchLocation.y-checkY + unitSize
                } else{
                    getSuperView.origin.y = touchLocation.y+checkY
                    getSuperView.size.height = getSuperView.size.height + oldY - touchLocation.y-checkY
                }

            }
            
            // set SuperView Live
            
            if(touchLocation.y > (getSuperView_Live.origin.y + getSuperView_Live.size.height - unitSize)){
                

            }else {
                getSuperView_Live.size.height = getSuperView_Live.size.height+(getSuperView_Live.origin.y-touchLocation.y)
                getSuperView_Live.origin.y = touchLocation.y
             
            }
            
            if(touchLocation.x < (getSuperView_Live.origin.x + unitSize)){

            }else{
                getSuperView_Live.size.width = touchLocation.x - getSuperView_Live.origin.x
            }
        viewParent1.frame = getSuperView_Live
        if(recognizer.state == .ended){
                viewParent1.frame = getSuperView
            }
        }
    @objc func cornerTopRightExDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {

//        if(recognizer.state == .ended){
            let touchLocation = recognizer.location(in: self.viewTotal)
        print(touchLocation.x)
            var getSuperView = viewParent1.frame
            var getSuperView_Live = viewParent1.frame
            
            var oldY = getSuperView.origin.y
            var newY = touchLocation.y
            var checkY = unitSize - newY.truncatingRemainder(dividingBy: unitSize)
            var checkX = (touchLocation.x - getSuperView.origin.x).truncatingRemainder(dividingBy: unitSize)
            
            // set SuperView update
            
            if( touchLocation.x < (getSuperView_Live.origin.x + unitWidth)){

            } else {
                if(checkX > unitSize/2){
                    getSuperView.size.width = (touchLocation.x - getSuperView.origin.x) - checkX + unitSize
                } else{
                    if ( (touchLocation.x - getSuperView.origin.x) == checkX){
                        getSuperView.size.width = 10
                    }else{
                        getSuperView.size.width = (touchLocation.x - getSuperView.origin.x)  - checkX
                    }
                }
            }

            if(touchLocation.y > (getSuperView_Live.origin.y + getSuperView_Live.size.height - unitSize)){

            }else{
                if(checkY > unitSize/2){
                    getSuperView.origin.y = touchLocation.y+checkY - unitSize
                    getSuperView.size.height = getSuperView.size.height + oldY - touchLocation.y-checkY + unitSize
                } else{
                    getSuperView.origin.y = touchLocation.y+checkY
                    getSuperView.size.height = getSuperView.size.height + oldY - touchLocation.y-checkY
                }

            }
            
            // set SuperView Live
            
            if(touchLocation.y > (getSuperView_Live.origin.y + getSuperView_Live.size.height - minHeight)){

            }else if(touchLocation.y>=0){
                getSuperView_Live.size.height = getSuperView_Live.size.height+(getSuperView_Live.origin.y-touchLocation.y)
                getSuperView_Live.origin.y = touchLocation.y
             
            }
            
            if(touchLocation.x < (getSuperView_Live.origin.x + minWidth)){

            } else if(touchLocation.x <= screenWidth ){
                getSuperView_Live.size.width = touchLocation.x - getSuperView_Live.origin.x
            }
        viewParent1.frame = getSuperView_Live
        if(recognizer.state == .ended){
                //viewParent1.frame = getSuperView
            }
        }
    @objc func cornerTopRightDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {

//        if(recognizer.state == .ended){
            let touchLocation = recognizer.location(in: self.viewTotal)
        print(touchLocation.x)
            var getSuperView = viewParent1.frame
            var getSuperView_Live = viewParent1.frame
            
            var oldY = getSuperView.origin.y
            var newY = touchLocation.y
            var checkY = unitSize - newY.truncatingRemainder(dividingBy: unitSize)
            var checkX = (touchLocation.x - getSuperView.origin.x).truncatingRemainder(dividingBy: unitSize)
            
            // set SuperView Live
            
            if(touchLocation.y > (getSuperView_Live.origin.y + getSuperView_Live.size.height - minHeight)){

            }else if(touchLocation.y>=0){
                getSuperView_Live.size.height = getSuperView_Live.size.height+(getSuperView_Live.origin.y-touchLocation.y)
                getSuperView_Live.origin.y = touchLocation.y
             
            }
            
            if(touchLocation.x < (getSuperView_Live.origin.x + minWidth)){

            } else if(touchLocation.x <= screenWidth ){
                getSuperView_Live.size.width = touchLocation.x - getSuperView_Live.origin.x
            }
        viewParent1.frame = getSuperView_Live
        if(recognizer.state == .ended){
                //viewParent1.frame = getSuperView
            }
        }
    
    
}
