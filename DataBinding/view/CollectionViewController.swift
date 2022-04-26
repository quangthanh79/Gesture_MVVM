//
//  CollectionViewController.swift
//  DataBinding
//
//  Created by Tuấn Phạm on 21/03/2022.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    

    @IBOutlet weak var collection: UICollectionView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let viewParent = UIView()
    var origin: CGPoint!
    var viewCenter: CGPoint!
    
    var items : Array<String> = Array()
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var unitSize : CGFloat!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...98 {
            items.append("\(i+1)")
        }
        setSize()
        setLayoutCell()
        setViewParent()
        
        viewParent.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragView)))
        setViewChildTopRight()
    }
    @objc func dragView1(gesture: UIPanGestureRecognizer) {
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
                let translation = gesture.translation(in: self.collection)
                target.frame.origin = CGPoint(x: origin.x + translation.x, y: origin.y + translation.y)
//                target.center = CGPoint(x: viewCenter!.x + translation.x, y: viewCenter!.y + translation.y)
            case .ended:
                let translation = gesture.translation(in: self.collection)

                print("X: \(translation.x)")
                print("Y: \(translation.y)")

                print("X_before: \(origin.x + translation.x)")
                print("Y_before: \(origin.y + translation.y)")
                var x_before = origin.x + translation.x
                var y_before = origin.y + translation.y


                var check_x = x_before.truncatingRemainder(dividingBy: unitSize)
                var check_y = y_before.truncatingRemainder(dividingBy: unitSize)

                var x_after : CGFloat!
                var y_after : CGFloat!
                if(check_x > unitSize/2){
                    x_after = x_before - check_x + unitSize
                }else {
                    x_after = x_before - check_x
                }
                if(check_y > unitSize/2){
                    y_after = y_before - check_y + unitSize
                }else {
                    y_after = y_before - check_y
                }
                target.frame.origin.x = x_after
                target.frame.origin.y = y_after


            default: break
            }
        }
    @objc func cornerTopRightDotMoveGesture(_ recognizer: UIPanGestureRecognizer) {
        print("Da bat duoc")
        let touchLocation = recognizer.location(in: self.collection)
        var getSuperView = viewParent.frame
        var getSuperView_Live = viewParent.frame
        
        var oldY = getSuperView.origin.y
        var newY = touchLocation.y
        var checkY = unitSize - newY.truncatingRemainder(dividingBy: unitSize)
        var checkX = (touchLocation.x - getSuperView.origin.x).truncatingRemainder(dividingBy: unitSize)
        
        // set SuperView update
        
        if( touchLocation.x < (getSuperView_Live.origin.x + unitSize)){

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
        print("check: \(getSuperView_Live.origin.y + getSuperView_Live.size.height - unitSize)")

        
        
        viewParent.frame = getSuperView_Live
        
        
        
        if(recognizer.state == .ended){
            viewParent.frame = getSuperView
        }
    }
    private func setSize(){
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        unitSize  = screenWidth/11
        screenHeight = screenSize.height
    }
    private func setViewChildTopRight(){
        let viewChildTopRight = UIView()
        viewChildTopRight.backgroundColor = .red
        viewParent.addSubview(viewChildTopRight)
        
        viewChildTopRight.translatesAutoresizingMaskIntoConstraints = false
        viewChildTopRight.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cornerTopRightDotMoveGesture(_:))))

        viewParent.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .trailing, relatedBy: .equal, toItem: viewParent, attribute: .trailing, multiplier: 1, constant: 0))
        viewParent.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .top, relatedBy: .equal, toItem: viewParent, attribute: .top, multiplier: 1, constant: 00))
        viewParent.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
        viewParent.addConstraint(NSLayoutConstraint(item: viewChildTopRight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 10))
    }

    private func setViewParent(){
        collection.addSubview(viewParent)
        viewParent.backgroundColor = .yellow
        var getView = viewParent.frame
        var getColection = collection.frame
        getView.size.width = unitSize
        getView.size.height = unitSize
        getView.origin.x = 5*unitSize
        getView.origin.y =  4*unitSize

        viewParent.frame = getView

    }
    private func setLayoutCell(){
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collection!.collectionViewLayout = layout
        let nibCell = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        collection.register(nibCell, forCellWithReuseIdentifier: reuseIdentifier)
    }
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 99
    }
    // set 1 ô
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionView
        let number = items[indexPath.row]
        cell.lblNumber.text = ""
        cell.layer.borderColor = UIColor.tintColor.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
                return CGSize(width: screenWidth/11, height: screenWidth/11);
        }
}
