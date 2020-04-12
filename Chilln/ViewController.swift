//
//  ViewController.swift
//  Chilln
//
//  Created by Muhammad Harviando on 08/04/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var n1: UIImageView!
    @IBOutlet weak var n2: UIImageView!
    @IBOutlet weak var n3: UIImageView!
    @IBOutlet weak var n4: UIImageView!
    @IBOutlet weak var n5: UIImageView!
    
    @IBOutlet weak var menu: UIView!
    
    @IBOutlet weak var audioOn: UIButton!
    @IBOutlet weak var audioOff: UIButton!
    
    @IBOutlet weak var ambientOn: UIButton!
    @IBOutlet weak var ambientOff: UIButton!
    
    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var buttonFullScreen: UIButton!
    
    var bgSoundAudio: AVAudioPlayer?
    var bgMusicAudio: AVAudioPlayer?
    var clickSoundAudio: AVAudioPlayer?
    
    var isMenu: Bool = false
    var isBbar: Bool = true
    var isTBar: Bool = true
    
    func playBgSound() {
        guard let url = Bundle.main.url(forResource: "forestAmbient", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            bgSoundAudio = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let ambientPlayer = bgSoundAudio else { return }

            ambientPlayer.play()
            ambientPlayer.numberOfLoops = -1
            ambientPlayer.volume = 1.5

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playBgMusic() {
        guard let url = Bundle.main.url(forResource: "relaxMusic", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            bgMusicAudio = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let musicPlayer = bgMusicAudio else { return }

            musicPlayer.play()
            musicPlayer.numberOfLoops = -1
            musicPlayer.volume = 0.4
            
            

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            clickSoundAudio = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)

            guard let player = clickSoundAudio else { return }

            player.play()
            player.volume = 0.2

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initial()
    }
    
    
    func initial(){
        n1.isHidden = false
        n2.isHidden = true
        n3.isHidden = true
        n4.isHidden = true
        n5.isHidden = true
        
        audioOff.isHidden = true
        ambientOff.isHidden = true
        
        playBgSound()
        playBgMusic()
        
        buttonFullScreen.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    
    func nextBG(){
        if(n1.isHidden == false){
            n1.isHidden = true
            n2.isHidden = false
            playClickSound()
            return
        }
        if(n2.isHidden == false){
            n2.isHidden = true
            n3.isHidden = false
            playClickSound()
            return
        }
        if(n3.isHidden == false){
            n3.isHidden = true
            n4.isHidden = false
            playClickSound()
            return
        }
        if(n4.isHidden == false){
            n4.isHidden = true
            n5.isHidden = false
            playClickSound()
            return
        }
        if(n5.isHidden == false){
            n5.isHidden = true
            n1.isHidden = false
            playClickSound()
            return
        }
    }
    
    func prevBG(){
        if(n1.isHidden == false){
            n1.isHidden = true
            n5.isHidden = false
            playClickSound()
            return
        }
        if(n2.isHidden == false){
            n2.isHidden = true
            n1.isHidden = false
            playClickSound()
            return
        }
        if(n3.isHidden == false){
            n3.isHidden = true
            n2.isHidden = false
            playClickSound()
            return
        }
        if(n4.isHidden == false){
            n4.isHidden = true
            n3.isHidden = false
            playClickSound()
            return
        }
        if(n5.isHidden == false){
            n5.isHidden = true
            n4.isHidden = false
            playClickSound()
            return
        }
    }
    
    @IBAction func buttonNKiri(_ sender: UIButton) {
        playClickSound()
        prevBG()
    }
    @IBAction func buttonNKanan(_ sender: UIButton) {
        playClickSound()
        nextBG()
    }
    @IBAction func buttonMenu(_ sender: UIButton) {
        if (isMenu == false){
            playClickSound()
            UIView.animate(withDuration: 0.6, animations: {
                self.menu.frame.origin.x += 200;
            }, completion: nil)
            isMenu = true
            return
        } else {
            playClickSound()
            UIView.animate(withDuration: 0.6, animations: {
                self.menu.frame.origin.x -= 200;
            }, completion: nil)
            isMenu = false
            return
        }
    }
    
    @IBAction func buttonN1(_ sender: UIButton) {
        playClickSound()
        n1.isHidden = false
        n2.isHidden = true
        n3.isHidden = true
        n4.isHidden = true
        n5.isHidden = true
    }
    
    @IBAction func buttonN2(_ sender: UIButton) {
        playClickSound()
        n1.isHidden = true
        n2.isHidden = false
        n3.isHidden = true
        n4.isHidden = true
        n5.isHidden = true
    }
    
    @IBAction func buttonN3(_ sender: UIButton) {
        playClickSound()
        n1.isHidden = true
        n2.isHidden = true
        n3.isHidden = false
        n4.isHidden = true
        n5.isHidden = true
    }
    
    @IBAction func buttonN4(_ sender: UIButton) {
        playClickSound()
        n1.isHidden = true
        n2.isHidden = true
        n3.isHidden = true
        n4.isHidden = false
        n5.isHidden = true
    }
    
    @IBAction func buttonN5(_ sender: UIButton) {
        playClickSound()
        n1.isHidden = true
        n2.isHidden = true
        n3.isHidden = true
        n4.isHidden = true
        n5.isHidden = false
    }
    
    @IBAction func buttonAon(_ sender: UIButton) {
        playClickSound()
        if(audioOff.isHidden == true){
            audioOff.isHidden = false
            audioOn.isHidden = true
            bgMusicAudio!.setVolume(0, fadeDuration: 1.0)
        }
    }
    
    @IBAction func buttonAoff(_ sender: UIButton) {
        playClickSound()
        if(audioOn.isHidden == true){
            audioOn.isHidden = false
            audioOff.isHidden = true
            bgMusicAudio!.setVolume(0.4, fadeDuration: 1.0)
        }
    }
    
    @IBAction func buttonAmbientOn(_ sender: UIButton) {
        playClickSound()
        if(ambientOff.isHidden == true){
            ambientOff.isHidden = false
            ambientOn.isHidden = true
            bgSoundAudio!.setVolume(0, fadeDuration: 1.0)
        }
    }
    
    @IBAction func buttonAmbientOff(_ sender: UIButton) {
        playClickSound()
        if(ambientOn.isHidden == true){
            ambientOn.isHidden = false
            ambientOff.isHidden = true
            bgSoundAudio!.setVolume(1.5, fadeDuration: 1.0)
        }
    }
    
    @IBAction func buttonFS(_ sender: UIButton) {
        if (isBbar == true){
            
            buttonFullScreen.setImage(UIImage(systemName: "chevron.compact.up"), for: .normal)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonFullScreen.frame.origin.y += 15;
            }, completion: nil)
            
            if (isMenu == true){
                UIView.animate(withDuration: 0.6, animations: {
                    self.menu.frame.origin.x -= 200;
                }, completion: nil)
                isMenu = false
            }
            playClickSound()
            UIView.animate(withDuration: 0.5, animations: {
                self.bottomBar.frame.origin.y += 100;
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.topBar.frame.origin.y -= 100;
            }, completion: nil)
            
            isBbar = false
            isTBar = false
            
            return
        } else {
            playClickSound()
            
            buttonFullScreen.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonFullScreen.frame.origin.y -= 15;
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.bottomBar.frame.origin.y -= 100;
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.topBar.frame.origin.y += 100;
            }, completion: nil)
            
            isBbar = true
            isTBar = true
            
            return
        }
    }
}

