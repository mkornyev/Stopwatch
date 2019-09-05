//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Max Kornyev on 8/30/19.
//  Copyright © 2019 Max Kornyev. All rights reserved.
//

import Foundation

class Stopwatch {
  
  private var startTime: NSDate?
  var isRunning: Bool
  
  init() {
    self.isRunning = false
  }
  
  var elapsedTime: TimeInterval {
    if let startTime = self.startTime {
      return -1 * startTime.timeIntervalSinceNow // could also just say -startTime.timeIntervalSinceNow
    } else {
      return 0
    }
  }
  
  var elapsedTimeAsString: String {
    let diffMinutes = Int(elapsedTime / 60)
    let diffSeconds = Int(elapsedTime)
    let diffMili = Int(elapsedTime.truncatingRemainder(dividingBy: 1)*10)
    
    let diffString: String = String(format: "%02d:%02d.%1d", diffMinutes, diffSeconds, diffMili)
    
    return diffString
  }
  
  func start() {
    startTime = NSDate()
    isRunning = true
  }
  
  func stop() {
    startTime = nil
    isRunning = false
  }
  
  func reset() {
    startTime = nil
    isRunning = false
  }
  
}
