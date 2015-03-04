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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addConstraint(NSLayoutConstraint(item: superButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -12.0))
        self.view.addConstraint(NSLayoutConstraint(item: subButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -18.0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
