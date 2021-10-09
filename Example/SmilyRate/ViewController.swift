//
//  ViewController.swift
//  SmilyRate
//
//  Created by abdallahnh on 10/09/2021.
//  Copyright (c) 2021 abdallahnh. All rights reserved.
//

import UIKit
import SmilyRate

class ViewController: UIViewController {

    @IBOutlet weak var smilyRateView: SmilyRateView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.smilyRateView = SmilyRateView()
        //let smilModel = SmilModel(
        //self.smilyRateView.setSmiling(smiling: [SmilModel])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

