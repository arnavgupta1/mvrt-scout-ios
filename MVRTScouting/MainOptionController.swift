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
        superButton.setImage(UIImage(named: "SuperIcon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forState: UIControlState.Normal)
        superButton.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 100.0, 0.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
