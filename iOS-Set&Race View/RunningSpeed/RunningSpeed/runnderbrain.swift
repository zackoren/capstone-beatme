//
//  runnderbrain.swift
//  RunningSpeed
//
//  Created by iZahi on 7/9/16.
//  Copyright © 2016 iZahi. All rights reserved.
//

import Foundation


class RunnerBrain{
    
    
    private var count = 0
    private var time = NSTimer()
    
    
    func timmer(){
        time = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "RunTimer", userInfo: nil, repeats: true)
    }
    
    
    func RunTimer() -> String{
        count += 1
        return String(count)
    }
    
}