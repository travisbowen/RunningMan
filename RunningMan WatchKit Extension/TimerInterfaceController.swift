//
//  TimerInterfaceController.swift
//  RunningMan WatchKit Extension
//
//  Created by Travis Bowen on 9/21/18.
//  Copyright © 2018 UpscaleApps. All rights reserved.
//

import WatchKit
import Foundation


class TimerInterfaceController: WKInterfaceController {

    @IBOutlet weak var timerLabel: WKInterfaceTimer!
    @IBOutlet weak var caloriesLabel: WKInterfaceLabel!
    @IBOutlet weak var resumeButton: WKInterfaceButton!
    @IBOutlet weak var pauseButton: WKInterfaceButton!
    @IBOutlet weak var cancelButton: WKInterfaceButton!
    var isPaused = false
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let runTime = context as? Int{
            timerLabel.setDate(Date(timeIntervalSinceNow: TimeInterval(runTime * 60)))
            timerLabel.start()
        }
        resumeButton.setAlpha(0.4)
    }
    
    
    @IBAction func resumeButtonTapped() {
        if isPaused{
            timerLabel.start()
            resumeButton.setAlpha(0.4)
            pauseButton.setAlpha(1.0)
            isPaused = false
        }
    }
    
    
    @IBAction func pauseButtonTapped() {
        if !isPaused{
            timerLabel.stop()
            resumeButton.setAlpha(1.0)
            pauseButton.setAlpha(0.4)
            isPaused = true
        }
    }
    
    
    @IBAction func cancelButtonTapped() {
        popToRootController()
    }
}
