//
//  SuperOptionsController.swift
//  MVRTScouting
//
//  Created by Alex Erf on 3/5/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class SuperOptionsController: UIViewController {
    
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var pitButton: UIButton!
    @IBOutlet weak var bluetoothButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        standButton.setImage(UIImage(named: "StandIcon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        
        standButton.tintColor = Colors.Gold.toColor()
        standButton.setTitleColor(Colors.Gold.toColor(), forState: UIControlState.Normal)
        pitButton.setImage(UIImage(named: "PitIcon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        
        pitButton.tintColor = Colors.Gold.toColor()
        pitButton.setTitleColor(Colors.Gold.toColor(), forState: UIControlState.Normal)
        bluetoothButton.setImage(UIImage(named: "BluetoothIcon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        
        bluetoothButton.tintColor = Colors.Gold.toColor()
        bluetoothButton.setTitleColor(Colors.Gold.toColor(), forState: UIControlState.Normal)
    }
    
}
