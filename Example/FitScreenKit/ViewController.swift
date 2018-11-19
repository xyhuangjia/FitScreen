//
//  ViewController.swift
//  FitScreenKit
//
//  Created by xyhuangjia@foxmail.com on 11/16/2018.
//  Copyright (c) 2018 xyhuangjia@foxmail.com. All rights reserved.
//

import UIKit
import FitScreenKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dev = FitScreenKit()
        
        print(dev.FactorX(value: 120))
        
//        print(FitScreenKit())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

