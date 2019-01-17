//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Pablo Albuja on 1/14/19.
//  Copyright © 2019 Ingenuity Applications. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton:UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL : URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case slow=0, fast, highPitch, lowPitch, echo, reverb}
    
    @IBAction func playSoundForButton(_ sender: UIButton)
    {
        print("Play sound button pressed!")
        
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate:1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton)
    {
        print("Stop sound button pressed!")
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrangeU()
        setupAudio()
    }
    
    func arrangeU(){
        slowButton.contentMode = .center
        slowButton.imageView?.contentMode = .scaleAspectFit
        fastButton.contentMode = .center
        fastButton.imageView?.contentMode = .scaleAspectFit
        highPitchButton.contentMode = .center
        highPitchButton.imageView?.contentMode = .scaleAspectFit
        lowPitchButton.contentMode = .center
        lowPitchButton.imageView?.contentMode = .scaleAspectFit
        echoButton.contentMode = .center
        echoButton.imageView?.contentMode = .scaleAspectFit
        reverbButton.contentMode = .center
        reverbButton.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI(.notPlaying)
    }
    

}
