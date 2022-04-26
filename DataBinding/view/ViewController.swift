//
//  ViewController.swift
//  DataBinding
//
//  Created by Tuấn Phạm on 18/03/2022.
//

import UIKit

    

class ViewController: UIViewController {
    private var viewModel: ViewModel!
    @IBOutlet weak var panView: UIView!
    @IBOutlet weak var panView2: UIView!
    var viewCenter: CGPoint!
    var myView : UIView!
    

    @IBOutlet weak var viewGreen: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ViewModel()
        self.viewModel.userOb.bind{ (_) in
            print("ban da thay doi user")
        }
        panView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragView)))
        setLeftDotView()
        setTopRightView()
        setRightDotView()
        setTopLeftDotView()
        setBottomRightView()
        setBottomLeftView()
        
        

    }
    
    
    func setTopRightView(){
        let toprightDotView = UIView()
        toprightDotView.backgroundColor = .red
        panView2.addSubview(toprightDotView)
        
        toprightDotView.translatesAutoresizingMaskIntoConstraints = false
        toprightDotView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerTopRightDotMoveGesture(_:))))
        
        panView2.addConstraint(NSLayoutConstraint(item: toprightDotView, attribute: .trailing, relatedBy: .equal, toItem: panView2, attribute: .trailing, multiplier: 1, constant: 0))
        panView2.addConstraint(NSLayoutConstraint(item: toprightDotView, attribute: .top, relatedBy: .equal, toItem: panView2, attribute: .top, multiplier: 1, constant: 00))
        panView2.addConstraint(NSLayoutConstraint(item: toprightDotView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
        panView2.addConstraint(NSLayoutConstraint(item: toprightDotView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
    }
    func setRightDotView(){
        let rightDotView = UIView()
        rightDotView.backgroundColor = .red
        panView2.addSubview(rightDotView)

        rightDotView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(rightDotMoveGesture(_:))))
        rightDotView.translatesAutoresizingMaskIntoConstraints = false

        panView2.addConstraint(NSLayoutConstraint(item: rightDotView, attribute: .trailing, relatedBy: .equal, toItem: panView2, attribute: .trailing, multiplier: 1, constant: 0))
        panView2.addConstraint(NSLayoutConstraint(item: rightDotView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 60))
        panView2.addConstraint(NSLayoutConstraint(item: rightDotView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
        let verticalConstraint1 = NSLayoutConstraint(item: rightDotView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: panView2, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([verticalConstraint1])
    }
    func setBottomRightView(){
        let bottomrightDotView = UIView()
        bottomrightDotView.backgroundColor = .red
        panView2.addSubview(bottomrightDotView)
        
        bottomrightDotView.translatesAutoresizingMaskIntoConstraints = false
        bottomrightDotView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerBottomRightDotMoveGesture(_:))))
        
        panView2.addConstraint(NSLayoutConstraint(item: bottomrightDotView, attribute: .trailing, relatedBy: .equal, toItem: panView2, attribute: .trailing, multiplier: 1, constant: 0))
        panView2.addConstraint(NSLayoutConstraint(item: bottomrightDotView, attribute: .bottom, relatedBy: .equal, toItem: panView2, attribute: .bottom, multiplier: 1, constant: 00))
        panView2.addConstraint(NSLayoutConstraint(item: bottomrightDotView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
        panView2.addConstraint(NSLayoutConstraint(item: bottomrightDotView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
    }
    func setTopLeftDotView(){
        let topleftDotView = UIView()
        topleftDotView.backgroundColor = .red
        panView2.addSubview(topleftDotView)
        
        topleftDotView.translatesAutoresizingMaskIntoConstraints = false
        topleftDotView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerTopLeftDotMoveGesture(_:))))
        
        panView2.addConstraint(NSLayoutConstraint(item: topleftDotView, attribute: .leading, relatedBy: .equal, toItem: panView2, attribute: .leading, multiplier: 1, constant: 0))
        panView2.addConstraint(NSLayoutConstraint(item: topleftDotView, attribute: .top, relatedBy: .equal, toItem: panView2, attribute: .top, multiplier: 1, constant: 00))
        panView2.addConstraint(NSLayoutConstraint(item: topleftDotView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
        panView2.addConstraint(NSLayoutConstraint(item: topleftDotView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
    }
    func setBottomLeftView(){
        let bottomleftDotView = UIView()
        bottomleftDotView.backgroundColor = .red
        panView2.addSubview(bottomleftDotView)
        
        bottomleftDotView.translatesAutoresizingMaskIntoConstraints = false
        bottomleftDotView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerBottomLeftDotMoveGesture(_:))))
        
        panView2.addConstraint(NSLayoutConstraint(item: bottomleftDotView, attribute: .leading, relatedBy: .equal, toItem: panView2, attribute: .leading, multiplier: 1, constant: 0))
        panView2.addConstraint(NSLayoutConstraint(item: bottomleftDotView, attribute: .bottom, relatedBy: .equal, toItem: panView2, attribute: .bottom, multiplier: 1, constant: 00))
        panView2.addConstraint(NSLayoutConstraint(item: bottomleftDotView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
        panView2.addConstraint(NSLayoutConstraint(item: bottomleftDotView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
    }
    func setLeftDotView(){
        let leftDotView = UIView()
        leftDotView.backgroundColor = .red
        panView2.addSubview(leftDotView)
        
        leftDotView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(leftDotMoveGesture(_:))))
        leftDotView.translatesAutoresizingMaskIntoConstraints = false

        panView2.addConstraint(NSLayoutConstraint(item: leftDotView, attribute: .leading, relatedBy: .equal, toItem: panView2, attribute: .leading, multiplier: 1, constant: 0))
        panView2.addConstraint(NSLayoutConstraint(item: leftDotView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 60))
        panView2.addConstraint(NSLayoutConstraint(item: leftDotView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
        let verticalConstraint = NSLayoutConstraint(item: leftDotView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: panView2, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([verticalConstraint])
    }
    
    
    @objc func rightDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {
        let touchLocation = recognizer.location(in: self.view)
        var getSuperView = panView2.frame
        getSuperView.size.width = touchLocation.x - getSuperView.origin.x
        panView2.frame = getSuperView
    }
    
    @objc func cornerTopLeftDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {
            let touchLocation = recognizer.location(in: self.view)
            var getSuperView = panView2.frame
            getSuperView.size.width = getSuperView.size.width + (getSuperView.origin.x - touchLocation.x)
            getSuperView.size.height = getSuperView.size.height + (getSuperView.origin.y-touchLocation.y)
        
            getSuperView.origin.x = touchLocation.x
            getSuperView.origin.y = touchLocation.y
            panView2.frame = getSuperView
        }
    @objc func cornerTopRightDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {
            let touchLocation = recognizer.location(in: self.view)
            var getSuperView = panView2.frame
            getSuperView.size.width = touchLocation.x - getSuperView.origin.x
        getSuperView.size.height = getSuperView.size.height+(getSuperView.origin.y-touchLocation.y)
        getSuperView.origin.y = touchLocation.y
        panView2.frame = getSuperView
        }
    @objc func cornerBottomRightDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {
            let touchLocation = recognizer.location(in: self.view)
            var getSuperView = panView2.frame
        getSuperView.size.width = touchLocation.x - getSuperView.origin.x
        getSuperView.size.height = touchLocation.y - getSuperView.origin.y
        
        panView2.frame = getSuperView
        }
    @objc func leftDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {
            let touchLocation = recognizer.location(in: self.view)
            var getSuperView = panView2.frame
            getSuperView.size.width = getSuperView.size.width + (getSuperView.origin.x - touchLocation.x)
            getSuperView.origin.x = touchLocation.x
        panView2.frame = getSuperView
        }
    @objc func cornerBottomLeftDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {
            let touchLocation = recognizer.location(in: self.view)
            var getSuperView = panView2.frame
        getSuperView.size.width = getSuperView.size.width + (getSuperView.origin.x - touchLocation.x)
        getSuperView.size.height = touchLocation.y - getSuperView.origin.y
        getSuperView.origin.x = touchLocation.x

        panView2.frame = getSuperView
        }
    @objc func dragView(gesture: UIPanGestureRecognizer) {
            let target = gesture.view!

            switch gesture.state {
            case .began:
                viewCenter = target.center
                var x = viewCenter!.x
                var y = viewCenter!.y
                print("\n")
                print("x_began:" + "\(x)")
                print("y_began:" + "\(y)")
            case .ended:
                viewCenter = target.center
                var x = viewCenter!.x
                var y = viewCenter!.y
                print("\n")
                print("x_end:" + "\(x)")
                print("y_end:" + "\(y)")
            case .changed:
                let translation = gesture.translation(in: self.view)
                target.center = CGPoint(x: viewCenter!.x + translation.x, y: viewCenter!.y + translation.y)

            default: break
            }
        }
    
}

