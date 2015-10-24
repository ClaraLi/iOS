//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Jingci Li on 10/23/15.
//  Copyright © 2015 Clara Li. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var audioPlayer:AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            let filePathUrl = NSURL.fileURLWithPath(filePath)
            do {
                // The initializer throws an error so lets try and initialize it
                audioPlayer = try AVAudioPlayer(contentsOfURL: filePathUrl)
            } catch let error as NSError {
                // If the initializer threw an error we catch the error and print it out.
                print(error.localizedDescription)
            }
        }
        else{
            print("The filepath is empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PlaySlow(sender: AnyObject) {
        audioPlayer.play()
    }

    @IBAction func PlayNormal(sender: AnyObject) {
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
