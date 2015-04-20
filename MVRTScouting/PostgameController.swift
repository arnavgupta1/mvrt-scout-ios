//
//  PostgameController.swift
//  MVRTScouting
//
//  Created by Siddharth Gollapudi on 3/27/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class PostgameController: UITableViewController {

    //connections to elements in the storyboard
    
    @IBOutlet weak var ContribTotesCounter: UIStepper!
    @IBOutlet weak var ContribTotesLabel: UILabel!
    
    @IBOutlet weak var EffSlider: UISlider!
    
    @IBOutlet weak var StackSlider: UISlider!
    
    @IBOutlet weak var CapSlider: UISlider!
    
    @IBOutlet weak var IntakeSlider: UISlider!
    
    @IBOutlet weak var OtherNoodSlider: UISlider!
    
    //vars for collecting data
    var contribTotes:Int = 0;
    var rightButton:UIBarButtonItem!
    
    var efficiencyPick = 0
    var stackPick = 0
    var capPick = 0
    var intakePick = 0
    var otherPick = 0
    
    //instances to collect data from other view controllers
    var teleopContr: TeleopController = TeleopController(nibName: nil, bundle: nil)
    var autonContr: AutonController = AutonController(nibName: nil, bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "submit", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("submitData"))
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    @IBAction func TotesContrib(sender: UIStepper) {
        contribTotes = Int(ContribTotesCounter.value);
        ContribTotesLabel.text = String(format: "%.1f", ContribTotesCounter.value);
    }
    
    @IBAction func EffSli(sender: AnyObject) {
        
        efficiencyPick = Int(EffSlider.value)
    }
    
    @IBAction func StackSli(sender: AnyObject) {
        
        stackPick = Int(StackSlider.value)
    }
    
    @IBAction func CapSli(sender: AnyObject) {
        capPick = Int(CapSlider.value)
    }
    
    @IBAction func IntakeSli(sender: AnyObject) {
        intakePick = Int(IntakeSlider.value)
    }
    
    @IBAction func OthNoodSli(sender: AnyObject) {
        otherPick = Int(OtherNoodSlider.value)
    }
    
    func submitData() {
        //using variables, send data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
