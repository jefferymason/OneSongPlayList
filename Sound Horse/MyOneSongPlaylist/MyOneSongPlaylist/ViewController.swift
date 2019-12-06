//
//  ViewController.swift
//  MyOneSongPlaylist
//
//  Created by Jeff Mason on 10/4/19.
//  Copyright © 2019 Jeff Mason. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func changeVolume(_ sender: UISlider) {
        
        audioPlayer?.setVolume(volumeSlider.value, fadeDuration: 0.1)
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        let index = sender.tag
        
        switch index {
        case 0:
            audioPlayer?.play()
        case 1:
            audioPlayer?.pause()
        case 2:
            audioPlayer?.currentTime = 0
            audioPlayer?.stop()
        default:
            break
        }
        
    }
    
    var audioPlayer:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "Cruel Summer", ofType: "wav")
            else { return }
        let url = URL(fileURLWithPath: path)
        audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        audioPlayer?.prepareToPlay()
        audioPlayer?.setVolume(0.5, fadeDuration: 0.1)
        audioPlayer?.play()
        // Do any additional setup after loading the view.
    }


}

