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
    
    var originalHeight: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        originalHeight = imageviewHeight.constant
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        let defaultTop: CGFloat = CGFloat(0)
        
        var currentTop: CGFloat = defaultTop
        
        if offset < 0{
            currentTop = offset
            imageviewHeight.constant = originalHeight - offset
        }else{
            imageviewHeight.constant = originalHeight
        }
        
        imageviewTop.constant = currentTop
    }
}


