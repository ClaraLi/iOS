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
    var receivedAudio:RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    override func viewDidLoad() {
        super.viewDidLoad()


        do {
            // The initializer throws an error so lets try and initialize it
            audioPlayer = try AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
            audioPlayer.enableRate = true
            audioEngine = AVAudioEngine()
            audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
        } catch let error as NSError {
            // If the initializer threw an error we catch the error and print it out.
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

    @IBAction func PlaySlow(sender: AnyObject) {
        
        playAudioWithVariableRate(0.5)
    }
    
    @IBAction func PlayFast(sender: AnyObject) {
        
        playAudioWithVariableRate(2.0)
    }
    
    @IBAction func PlayChipMunk(sender: AnyObject) {
        
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func PlayDarthVader(sender: AnyObject) {
        
        playAudioWithVariablePitch(-1000)
    }
   
    func playAudioWithVariableRate(rate: Float){
        stopAllAudio()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
   
    func playAudioWithVariablePitch(pitch: Float){
        stopAllAudio()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    func stopAllAudio(){
        audioPlayer.stop()
        audioEngine.stop()    }
   
    @IBAction func PlayStop(sender: AnyObject) {
        stopAllAudio()
    }


}
