//
//  ViewController.swift
//  speedometer
//
//  Created by Johann Pardanaud on 29/09/2015.
//  Copyright © 2015 Johann Pardanaud. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SpeedManagerDelegate {

    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var notificationsSwitch: UISwitch?

    let speedManager = SpeedManager()

    override func viewDidLoad() {
        
        speedManager.delegate = self
        speedSlider.addTarget(self, action: #selector(sliderValueDidChanged(_:)), for: .valueChanged)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let scale: CGFloat = SpeedNotifier.sharedNotifier().reflect ? -1 : 1
        let transform = CGAffineTransform.init(scaleX: 1, y: scale)
        speedLabel.transform = transform
    }

    func speedDidChange(speed: Speed) {
        speedLabel?.text = String(Int(speed))
    }
    
    @objc func sliderValueDidChanged(_ sender: UISlider) {
        let speedText = String.init(format: "%.0f", sender.value * 100)
        UIView.animate(withDuration: 0.5) {
            self.speedLabel?.text = speedText
            self.speedLabel.layoutIfNeeded()
        }
    }

}

