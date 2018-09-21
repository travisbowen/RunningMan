//
//  InterfaceController.swift
//  RunningMan WatchKit Extension
//
//  Created by Travis Bowen on 9/20/18.
//  Copyright © 2018 UpscaleApps. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet private weak var startButton: WKInterfaceButton!
    @IBOutlet private weak var slider: WKInterfaceSlider!
    private var runTime = 5
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    
    @IBAction func runTimeChanged(_ value: Float) {
        runTime = Int(value)
        startButton.setTitle("Start \(runTime) min run")
    }
    
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if (segueIdentifier == "timerSegue"){
            return runTime
        }
        return nil
    }
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
