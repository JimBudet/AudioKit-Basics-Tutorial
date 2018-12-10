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
    
    
    // Cell 1 - Oscillator 1
    
    @IBOutlet weak var oscillator1OnOffControl: UISwitch!
    @IBOutlet weak var oscillator1FrequencyControl: UISlider!

    @IBAction func oscillator1OnOffAction(_ sender: UISwitch) {
        sender.isOn ? oscillator1.start() : oscillator1.stop()
    }
    
    @IBAction func oscillator1FrequencyAction(_ sender: UISlider) {
        oscillator1.frequency = Double(sender.value)
    }

    
    // Cell 2 - Oscillator 2
    
    @IBOutlet weak var oscillator2OnOffControl: UISwitch!
    @IBOutlet weak var oscillator2FrequencyControl: UISlider!

    @IBAction func oscillator2OnOffAction(_ sender: UISwitch) {
        sender.isOn ? oscillator2.start() : oscillator2.stop()
    }
    
    @IBAction func oscillator2FrequencyAction(_ sender: UISlider) {
        oscillator2.frequency = Double(sender.value)
    }
    
    
    // Cell 3 - Mixer
    
    @IBOutlet weak var oscillator1VolumeControl: UISlider!
    @IBOutlet weak var oscillator2VolumeControl: UISlider!
    @IBOutlet weak var mixerVolumeControl: UISlider!
    
    @IBAction func oscillator1VolumeAction(_ sender: UISlider) {
        oscillator1.amplitude = Double(sender.value)
    }
    
    @IBAction func oscillator2VolumeAction(_ sender: UISlider) {
        oscillator2.amplitude = Double(sender.value)
    }
    
    @IBAction func mixerVolumeAction(_ sender: UISlider) {
        mixer.volume = Double(sender.value)
    }



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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        oscillator1OnOffControl.setOn(oscillator1.isStarted, animated: false)
        oscillator1FrequencyControl.value = Float(oscillator1.frequency)

        oscillator2OnOffControl.setOn(oscillator2.isStarted, animated: false)
        oscillator2FrequencyControl.value = Float(oscillator2.frequency)
        
        oscillator1VolumeControl.value = Float(oscillator1.amplitude)
        oscillator2VolumeControl.value = Float(oscillator2.amplitude)
        mixerVolumeControl.value = Float(mixer.volume)
    }
}
