//
//  TeleopController.swift
//  MVRTScouting
//
//  Created by Siddharth Gollapudi on 3/27/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class TeleopController: UITableViewController {


    @IBOutlet weak var NoodlesLandfillCounter: UIStepper!
    @IBOutlet weak var NoodleLandfillLabel: UILabel!
    
    @IBOutlet weak var NoodleInBin: UISegmentedControl!
    
    @IBOutlet weak var CappedStack: UISegmentedControl!
    
    @IBOutlet weak var KnockedStacksCounter: UIStepper!
    @IBOutlet weak var KnockedStacksLabel: UILabel!
    
    @IBOutlet weak var StacksMadeLabel: UILabel!
    @IBOutlet weak var StacksMadeCounter: UIStepper!
    
    @IBOutlet weak var LostTotesCounter: UIStepper!
    @IBOutlet weak var LostTotesLabel: UILabel!
    
    @IBOutlet weak var FeederTotesCounter: UIStepper!
    @IBOutlet weak var FeederTotesLabel: UILabel!
    
    @IBOutlet weak var LandfillTotesCounter: UIStepper!
    @IBOutlet weak var LandfillTotesLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    @IBAction func LandfillTotes(sender: UIStepper) {
        
    }
    
    @IBAction func FeederTotes(sender: UIStepper) {
        
    }
    
    @IBAction func TotesLost(sender: UIStepper) {
        
    }
    
    @IBAction func StacksMade(sender: UIStepper) {
        
    }
    
    @IBAction func StacksKnockedOver(sender: UIStepper) {
        
    }
    
    @IBAction func CappedStacks(sender: UISegmentedControl) {
        
    }
    
    @IBAction func InBinEver(sender: UISegmentedControl) {
        
    }
    
    @IBAction func NoodlesToLandfill(sender: UIStepper) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
