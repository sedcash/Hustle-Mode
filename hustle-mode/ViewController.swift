//
//  ViewController.swift
//  hustle-mode
//
//  Created by Sedrick Cashaw Jr on 12/10/17.
//  Copyright © 2017 Sedrick Cashaw Jr. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var powerBTN: UIButton!
    @IBOutlet weak var hustleLBL: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var rocket: UIImageView!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError{
            print(error.description)
        }
    }
    

    @IBAction func powerBTNPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBTN.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 145, width: 375, height: 402)
        }) { (finished) in
            self.hustleLBL.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    

}

