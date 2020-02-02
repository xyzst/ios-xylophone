//
//  ViewController.swift
//  Xylophone
//
//  Created by Darren Rambaud on 02/01/2020.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var VALID_NOTES = ["C", "D", "E", "F", "G", "A", "B"]
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.33
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200), execute: {
            self.playNote(sender.currentTitle!)
            sender.alpha = 1.0
        })
    }
    
    func playNote(_ note: String) -> Bool {
        if (!VALID_NOTES.contains(note)) {
            print("[ERR] Attempting to play a note that is NOT available (\(note))")
            return false
        }
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
        return true
    }
    

}

