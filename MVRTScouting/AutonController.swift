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
    
    var location = "nothing";
    var getCans = false;
    var yellowTotes = false;
    var stgAreaCans = false;
    var autonEnd = false;
    var roboInterfere = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func Location(sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
            case 0:
                location = "Stg. Area"
            case 1:
                location = "Landfill"
            default:
                break;
        }
        
    }
    
    @IBAction func StepCan(sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
            case 0:
                getCans = true;
            case 1:
                getCans = false;
            default:
                break;
        }
        
    }
    
    @IBAction func YellowTote(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            case 0:
                yellowTotes = true;
            case 1:
                yellowTotes = false;
            default:
                break;
        }
    }
    
    @IBAction func StgArea(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            case 0:
                stgAreaCans = true;
            case 1:
                stgAreaCans = false;
            default:
                break;
        }
    }
    
    @IBAction func AutonZoneEnd(sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
            case 0:
                autonEnd = true;
            case 1:
                autonEnd = false;
            default:
                break;
        }
    }

    @IBAction func InterfereRobot(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                roboInterfere = true;
            case 1:
                roboInterfere = false;
            default:
                break;
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
