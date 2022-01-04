//
//  AVPlayerTestViewController.swift
//  Homework48PresentController
//
//  Created by 黃柏嘉 on 2022/1/3.
//

import UIKit
import AVKit

class AVPlayerTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func showVideo(_ sender: UIButton) {
        if let url = Bundle.main.url(forResource: "夜曲", withExtension: ".mp4"){
            let player = AVPlayer(url: url)
            let controller = AVPlayerViewController()
            controller.player = player
            present(controller, animated: true) {
                player.play()
            }
        }
    }
    

    
}
