//
//  ViewController.swift
//  StretchyEffect
//
//  Created by Eduardo Carrillo on 3/31/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageviewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var imageviewTop: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var stickyHeight: CGFloat!
    
    var originalHeight: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        originalHeight = imageviewHeight.constant
        
        //Make the height of sticky image fraction of image
        //This sticky height is arbitrary you can make it whatever you feel like.
        let scaleFactor = CGFloat(2)
        
        //Make the height of the sticky part 'one eighth' of the size of the image
        stickyHeight = imageviewHeight.constant / scaleFactor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        let stickyThreshold = originalHeight - stickyHeight
        
        let defaultTop: CGFloat = CGFloat(0)
        
        var currentTop: CGFloat = defaultTop
        print("offset: \(offset)")
        
        if offset < 0{
            currentTop = offset
            imageviewHeight.constant = originalHeight - offset
        }else{
            if (offset > stickyThreshold){ //Once only bottom 'one eighth of image shows....
                //Keep pushing the image down to give illusion of stickiness
                //How much do we push down?
                //The amount we traveled relative to point that maintains our scaled background imageview height
                currentTop = offset - stickyThreshold //
                
            }else {
                //If we don't go bottom 1/scaleFactor is not showing exclusively then dont move image down.
            }
            imageviewHeight.constant = originalHeight
        }
        
        imageviewTop.constant = currentTop

        
    }
}


