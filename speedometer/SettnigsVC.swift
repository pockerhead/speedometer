//
//  SettnigsVC.swift
//  speedometer
//
//  Created by Артём Балашов on 16.09.2018.
//  Copyright © 2018 Johann Pardanaud. All rights reserved.
//

import UIKit

class SettnigsVC: UIViewController, SpeedNotifierDelegate {

    @IBOutlet weak var notificationsSwitch: UISwitch!
    @IBOutlet weak var reflectSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        SpeedNotifier.sharedNotifier().delegate = self
        // Do any additional setup after loading the view.
    }
    func notificationsStatusDidChange(shouldNotify: Bool) {
        notificationsSwitch?.isOn = shouldNotify
    }
    @IBAction func didSelectNotificationSwitch(_ sender: UISwitch) {
        SpeedNotifier.sharedNotifier().shouldNotify = sender.isOn
    }
    
    @IBAction func didSelectReflectSwitch(_ sender: UISwitch) {
        SpeedNotifier.sharedNotifier().reflect = sender.isOn
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
