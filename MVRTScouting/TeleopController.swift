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
    
    
    var landfillTotes:Int = 0;
    var feederTotes:Int = 0;
    var lostTotes:Int = 0;
    
    var madeStacks:Int = 0;
    var knockedStacks:Int = 0;
    
    var stackCapped = false;
    
    var inBinEver = false;
    var noodleToLandfill:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    @IBAction func LandfillTotes(sender: UIStepper) {
        
        //LandfillTotesLabel.text = NSString(format: "%.1f", 0.0);
        
        landfillTotes = Int(LandfillTotesCounter.value);
        LandfillTotesLabel.text = String(format: "%.1f", LandfillTotesCounter.value)
        
    }
    
    @IBAction func FeederTotes(sender: UIStepper) {
        
        //FeederTotesLabel.text = NSString(format: "%.1f", 0.0);
        feederTotes = Int(FeederTotesCounter.value);
        FeederTotesLabel.text = String(format: "%.1f", FeederTotesCounter.value) as String;
    }
    
    @IBAction func TotesLost(sender: UIStepper) {
        
        //LostTotesLabel.text = NSString(format: "%.1f", 0.0);
        lostTotes = Int(LostTotesCounter.value);
        LostTotesLabel.text = String(format: "%.1f", LostTotesCounter.value);
    }
    
    @IBAction func StacksMade(sender: UIStepper) {
        
        //StacksMadeLabel.text = NSString(format: "%.1f", 0.0);
        madeStacks = Int(StacksMadeCounter.value);
        StacksMadeLabel.text = String(format: "%.1f", StacksMadeCounter.value);
    }
    
    @IBAction func StacksKnockedOver(sender: UIStepper) {
        
        //KnockedStacksLabel.text = NSString(format: "%.1f", 0.0);
        
        knockedStacks = Int(KnockedStacksCounter.value);
        KnockedStacksLabel.text = String(format: "%.1f", KnockedStacksCounter.value);
    }
    
    @IBAction func CappedStacks(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            stackCapped = true;
        case 1:
            stackCapped = false;
        default:
            break;
        }
    }
    
    @IBAction func InBinEver(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            inBinEver = true;
        case 1:
            inBinEver = false;
        default:
            break;
        }
    }
    
    @IBAction func NoodlesToLandfill(sender: UIStepper) {
        
        NoodleLandfillLabel.text = String(format: "%.1f", 0.0);
        noodleToLandfill = Int(NoodlesLandfillCounter.value);
        NoodleLandfillLabel.text = String(format: "%.1f", NoodlesLandfillCounter.value);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
