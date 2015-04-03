//
//  SuperSettingsController.swift
//  MVRTScouting
//
//  Created by Alex Erf on 3/3/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class SuperSettingsController: UIViewController {
    
    @IBOutlet private weak var allianceControl: UISegmentedControl!
    @IBOutlet private weak var nameInput: UITextField!
    @IBOutlet private weak var acceptingConnectionsSwitch: UISwitch!
    
    var isAcceptingConnections : Bool {
        return acceptingConnectionsSwitch.on
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
