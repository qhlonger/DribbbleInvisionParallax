//
//  ViewController.swift
//  DribbbleInvision
//
//  Created by pingguo on 2018/5/6.
//  Copyright © 2018年 hl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let parallaxView = ParallaxCardView()
        parallaxView.frame = view.bounds
        view.addSubview(parallaxView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

