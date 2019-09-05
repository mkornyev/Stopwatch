//
//  ViewController.swift
//  Stopwatch
//
//  Created by Max Kornyev on 8/30/19.
//  Copyright © 2019 Max Kornyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let stopwatch = Stopwatch()
  
  @IBOutlet weak var elapsedTimeLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
//    fadeInAnimation()
  }
  
  @objc func updateElapsedTimeLabel(timer: Timer) {
    if stopwatch.isRunning {
      elapsedTimeLabel.text = stopwatch.elapsedTimeAsString
    } else {
      timer.invalidate()
    }
  }
  
//  func fadeInAnimation() {
////    myView.frame = CGRect(x: 0, y: 0, width: 800, height: 800)
////    view.addSubview(myView)
//    let myView = UIView()
//
//    UIView.animate(withDuration: 5) {
//      myView.alpha = 0
//    }
//  }
  
  // Button Funcs
  @IBAction func startButtonTapped(sender: UIButton) {
    sender.shake() // Animate button
    
    Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel), userInfo: nil, repeats: true)
    
    stopwatch.start()
  }
  @IBAction func stopButtonTapped(sender: UIButton) {
    if stopwatch.isRunning { // Avoid redundant shake feedback
      sender.shake()
    }
    stopwatch.stop()
  }
  @IBAction func resetButtonTapped(sender: UIButton) {
    if elapsedTimeLabel.text != "00:00.0" { // Avoid reduntant feedback
      sender.shake()
    }
    stopwatch.reset()
    elapsedTimeLabel.text = "00:00.0"
  }
}
