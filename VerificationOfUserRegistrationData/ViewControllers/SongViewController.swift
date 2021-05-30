//
//  SongViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 30.05.2021.
//

import UIKit
import AVFoundation

class SongViewController: UIViewController {
    
    @IBOutlet weak var nikulinImageView: UIImageView!
    
    private var audioPlayer = AVAudioPlayer()
    
    private let primaryColor = UIColor(
        red: CGFloat.random(in: 0...255),
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255 ,
        green: CGFloat.random(in: 0...255),
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageAndView()
        doCatchAudio()

    }
    private func doCatchAudio () {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "песня про зайцев", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {
            
        }
    }
    
    private func setupImageAndView() {
        nikulinImageView.image = UIImage(named: "никулин")
        
        view.addverticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    @IBAction func startBtnPressed(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func stopBtnPressed(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }
    }
    
    @IBAction func restartBtnPressed(_ sender: Any) {
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
}
