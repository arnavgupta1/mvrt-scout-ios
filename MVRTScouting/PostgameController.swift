//
//  PostgameController.swift
//  MVRTScouting
//
//  Created by Siddharth Gollapudi on 3/27/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class PostgameController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var ContribTotesCounter: UIStepper!
    @IBOutlet weak var ContribTotesLabel: UILabel!
    
    @IBOutlet weak var EfficiencyPicker: UIPickerView!
    
    @IBOutlet weak var StackAbilityPicker: UIPickerView!
    
    @IBOutlet weak var CapAbilityPicker: UIPickerView!
    
    @IBOutlet weak var IntakeAbilityPicker: UIPickerView!
    
    @IBOutlet weak var OtherNoodlePicker: UIPickerView!
    
    var contribTotes:Int = 0;
    let pickerData = ["Did Not","Tried, Unsuccessful","Inconsistent","Inefficient","Consistent","Powerhouse"];
    
    var efficiencyPick = "nothing"
    var stackPick = "nothing"
    var capPick = "nothing"
    var intakePick = "nothing"
    var otherPick = "nothing"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EfficiencyPicker.dataSource = self;
        EfficiencyPicker.delegate = self;
        EfficiencyPicker.tag = PickerTag.effTag.rawValue;
        
        StackAbilityPicker.dataSource = self;
        StackAbilityPicker.delegate = self;
        StackAbilityPicker.tag = PickerTag.stackTag.rawValue;
        
        CapAbilityPicker.dataSource = self;
        CapAbilityPicker.delegate = self;
        CapAbilityPicker.tag = PickerTag.capTag.rawValue;
        
        IntakeAbilityPicker.dataSource = self;
        IntakeAbilityPicker.delegate = self;
        IntakeAbilityPicker.tag = PickerTag.intakeTag.rawValue;
        
        OtherNoodlePicker.dataSource = self;
        OtherNoodlePicker.delegate = self;
        OtherNoodlePicker.tag = PickerTag.otherTag.rawValue;
    }
    
    enum PickerTag: Int {
        // Integer values will be implicitly supplied; you could optionally set your own values
        case effTag
        case stackTag
        case capTag
        case intakeTag
        case otherTag
    }
    
    @IBAction func TotesContrib(sender: UIStepper) {
        contribTotes = Int(ContribTotesCounter.value);
        ContribTotesLabel.text = NSString(format: "%.1f", ContribTotesCounter.value);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let tag = PickerTag(rawValue: pickerView.tag) {
            
            switch tag {
            case .effTag:
                efficiencyPick = pickerData[row]
                
            case .stackTag:
                stackPick = pickerData[row]
                
            case .capTag:
                capPick = pickerData[row]
                
            case .intakeTag:
                intakePick = pickerData[row]
                
            case .otherTag:
                otherPick = pickerData[row]
                
            default:
                println("Unknown pickerView.")
            }
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    

   

}
