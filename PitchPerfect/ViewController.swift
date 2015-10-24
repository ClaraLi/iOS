//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Jingci Li on 10/23/15.
//  Copyright © 2015 Clara Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RecordInProgress: UILabel!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var RecordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func Record(sender: AnyObject) {
        RecordInProgress.hidden = false
        StopButton.hidden = false
        RecordButton.enabled = false
        
    }
    @IBAction func Stop(sender: AnyObject) {
        RecordInProgress.hidden = true
        StopButton.hidden = true
    }

}

