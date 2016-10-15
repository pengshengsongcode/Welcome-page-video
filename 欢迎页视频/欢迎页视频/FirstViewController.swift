//
//  FirstViewController.swift
//  欢迎页视频
//
//  Created by 彭盛凇 on 16/10/15.
//  Copyright © 2016年 huangbaoche. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class FirstViewController: UIViewController {

    var videoUrl: URL!
    
    var player: AVPlayer!
    
    lazy var enterBtn: UIButton = {
       
        let btn = UIButton(type: .custom)
        
        btn.frame = CGRect(x: 24, y: UIScreen.main.bounds.size.height - 32 - 48, width: UIScreen.main.bounds.size.width - 48, height: 48)
        
        btn.addTarget(self, action: #selector(enter), for: UIControlEvents.touchUpInside)
        
        btn.setTitle("进入应用", for: UIControlState.normal)

        btn.layer.borderWidth = 1
        
        btn.layer.cornerRadius = 24
        
        btn.layer.borderColor = UIColor.white.cgColor
        
        btn.alpha = 0
        
        return btn
    }()
    
    func enter() {
        //更改主控制器
        
        print("更改主控制器")
        
        let vc = ViewController()
        
        let window = UIApplication.shared.keyWindow
        
        window?.rootViewController = vc

    }

//  出现灰色。。。 ToT...
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let moviePlayer = AVPlayerViewController()
//        
//        let player = AVPlayer(url: videoUrl)
//        
//        moviePlayer.player = player
//        
//        moviePlayer.view.frame = view.frame
//        
//        moviePlayer.player?.play()
//        
//        view.addSubview(moviePlayer.view)
//        
//        view.addSubview(enterBtn)
//        
//        UIView.animate(withDuration: 3.0) {
//            //需要弱化
//            self.enterBtn.alpha = 1.0
//        }
//    }
    
    
//  不出现灰色。。。 ^o^...
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //隐藏状态栏
        
        UIApplication.shared.isStatusBarHidden = true
        
        player = AVPlayer(url: videoUrl)
        
        player.play()
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = view.bounds
        
        view.layer.addSublayer(playerLayer)
        
        view.addSubview(enterBtn)
        
        UIView.animate(withDuration: 3.0) {
            
            //需要弱化
            self.enterBtn.alpha = 1.0
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(runLoopTheMovie), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
    }
    
    func runLoopTheMovie() {
        
        print("视频播放结束")
        
        player.seek(to: CMTimeMake(0, 1))
        
        player.play()
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
