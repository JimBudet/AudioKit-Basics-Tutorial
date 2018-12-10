//
//  TableViewController.swift
//  AudioKit-Basics-Tutorial
//
//  Created by Jaime Budet on 12/10/18.
//  Copyright © 2018 JimBudet. All rights reserved.
//

import AudioKit
import UIKit

class TableViewController: UITableViewController {

    var oscillator1 = AKOscillator()
    var oscillator2 = AKOscillator()
    var mixer = AKMixer()

    override func viewDidLoad() {
        super.viewDidLoad()

        oscillator1.frequency = random(in: 220 ... 880)
        
        oscillator2.frequency = random(in: 220 ... 880)
        
        mixer = AKMixer(oscillator1, oscillator2)
        mixer.volume = 0.5
        
        AudioKit.output = mixer
        
        do {
            try AudioKit.start()
        }
        catch {
            AKLog("AudioKit did not start!")
        }
        
        oscillator1.start()
        oscillator2.start()
    }
}
