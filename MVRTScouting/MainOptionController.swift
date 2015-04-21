//
//  MainOptionController.swift
//  MVRTScouting
//
//  Created by Alex Erf on 3/3/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit

class MainOptionController: UIViewController {
        
    @IBOutlet weak var superButton: UIButton!
    @IBOutlet weak var subButton: UIButton!

    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.barTintColor = Colors.Purple.toColor()
        self.navigationController?.navigationBar.tintColor = Colors.Gold.toColor()
        self.navigationController?.navigationBar.translucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        superButton.setImage(UIImage(named: "SuperIcon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        superButton.tintColor = Colors.Gold.toColor()
        superButton.setTitleColor(Colors.Gold.toColor(), forState: UIControlState.Normal)
        subButton.setImage(UIImage(named: "SubIcon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        subButton.tintColor = Colors.Gold.toColor()
        subButton.setTitleColor(Colors.Gold.toColor(), forState: UIControlState.Normal)
        self.view.addConstraint(NSLayoutConstraint(item: superButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -12.0))
        self.view.addConstraint(NSLayoutConstraint(item: subButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -18.0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    
    @IBAction func willMoveToSuperScout(sender: AnyObject) {
        SuperBluetoothHandler.sharedInstance.startConnecting()
    }
    
    @IBAction func willMoveToSubScout(sender: AnyObject) {
        println("HI")
        SubScoutBluetoothHandler.sharedInstance.startConnecting()
    }

}
