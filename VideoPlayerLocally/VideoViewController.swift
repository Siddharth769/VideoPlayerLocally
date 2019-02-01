//
//  VideoViewController.swift
//  VideoPlayerLocally
//
//  Created by siddharth on 01/02/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController {

    var index: String?
    var player: AVPlayer?

    @IBOutlet weak var pauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideoFile(file: index!, type: "mp4")
        initializeVideoPlayer()
    }
    
    @IBAction func pauseButtonAction(_ sender: Any) {
        if(player?.rate == 1.0) {
            player?.pause()
            pauseButton.setTitle("Play", for: .normal)
        }else {
            player?.play()
        }
    }
    
    @IBAction func rewindButton(_ sender: Any) {
        player!.rate -= 0.5
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        player!.rate += 0.5
    }
    
    @IBAction func volumeUp(_ sender: Any) {
        player?.volume += 1
    }
    @IBAction func volumeDown(_ sender: Any) {
        player?.volume -= 1
    }
}

extension VideoViewController {
    
    func initializeVideoPlayer(){
        let playerLayerAV = AVPlayerLayer(player: player)
        playerLayerAV.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayerAV)
        player?.play()
        pauseButton.setTitle("Pause", for: .normal)
    }
    
    func playVideoFile(file: String, type: String) ->AVPlayer? {
        
        let path = Bundle.main.path(forResource: file, ofType: type)
        let url = NSURL.fileURL(withPath: path!)
        
        do{
            try player = AVPlayer(url: url)
        }catch {
            print("Error playing video via AVPlayer")
        }
        return player
    }
}
