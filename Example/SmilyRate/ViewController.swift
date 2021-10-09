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

        let sm1 = SmilModel(image: UIImage(imageLiteralResourceName: "1"), title: "Very Satisfied")
        let sm2 = SmilModel(image: UIImage(imageLiteralResourceName: "2"), title: "Satisfied")
        let sm3 = SmilModel(image: UIImage(imageLiteralResourceName: "3"), title: "Neutral")
        let sm4 = SmilModel(image: UIImage(imageLiteralResourceName: "4"), title: "Dissatisfied")
        let sm5 = SmilModel(image: UIImage(imageLiteralResourceName: "5"), title: "Very Dissatisfied")

        self.smilyRateView.setSmiling(smiling: [sm1, sm2, sm3, sm4, sm5])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

