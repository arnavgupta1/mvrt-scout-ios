//
//  SuperStandScoutingController.swift
//  MVRTScouting
//
//  Created by Alex Erf on 3/3/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class SuperStandScoutingController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!

    override func loadView() {
        super.loadView()
        startButton.backgroundColor = Colors.Purple.toColor()
        startButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        startButton.layer.cornerRadius = 10.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
