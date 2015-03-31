//
//  PostgameController.swift
//  MVRTScouting
//
//  Created by Siddharth Gollapudi on 3/27/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class PostgameController: UITableViewController {

    
    @IBOutlet weak var ContribTotesCounter: UIStepper!
    @IBOutlet weak var ContribTotesLabel: UILabel!
    
    @IBOutlet weak var EfficiencyPicker: UIPickerView!
    
    @IBOutlet weak var StackAbilityPicker: UIPickerView!
    
    @IBOutlet weak var CapAbilityPicker: UIPickerView!
    
    @IBOutlet weak var IntakeAbilityPicker: UIPickerView!
    
    @IBOutlet weak var OtherNoodlePicker: UIPickerView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}
