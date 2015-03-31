//
//  AutonController.swift
//  MVRTScouting
//
//  Created by Siddharth Gollapudi on 3/27/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class AutonController: UITableViewController {

    @IBOutlet weak var InterfereRobots: UISegmentedControl!
    
    @IBOutlet weak var EndAutonZone: UISegmentedControl!
    
    @IBOutlet weak var PickUpStgAreaCans: UISegmentedControl!
    
    @IBOutlet weak var PickUpYellowTotes: UISegmentedControl!
    
    @IBOutlet weak var StartLocation: UISegmentedControl!
    
    @IBOutlet weak var GetCansFromStep: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func Location(sender: UISegmentedControl) {
        
    }
    
    @IBAction func StepCan(sender: AnyObject) {
        
    }
    
    @IBAction func YellowTote(sender: UISegmentedControl) {
        
    }
    
    @IBAction func StgArea(sender: UISegmentedControl) {
        
    }
    
    @IBAction func AutonZoneEnd(sender: AnyObject) {
        
    }

    @IBAction func InterfereRobot(sender: UISegmentedControl) {
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
