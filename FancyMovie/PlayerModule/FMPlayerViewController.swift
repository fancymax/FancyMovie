//
//  FMPlayerViewController.swift
//  FancyMovie
//
//  Created by fancymax on 21/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import Cocoa
import AVFoundation

class FMPlayerViewController: NSViewController {
    
    @IBOutlet weak var playerBackView: FMPlayerbackView!
    var player:AVPlayer!
    var playerItem:AVPlayerItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = AVPlayer()
        playerBackView.wantsLayer = true
    }
    
    @IBAction func startPlayer(_ sender: Any) {
        if player.status == .readyToPlay {
            self.player.pause()
        }
        else {
            let url = URL(fileURLWithPath: "/Users/ws/Desktop/test/2K Video Demo.mp4")
            let asset = AVAsset(url: url)
            self.playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: ["playable"])
            self.player.replaceCurrentItem(with: playerItem)
            
            let playerLayer = AVPlayerLayer(player: self.player)
            playerLayer.videoGravity = .resizeAspect
            playerBackView.layer = playerLayer
            
            self.player.play()
        }
    }
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("FMPlayerViewController")
    }
    
}
