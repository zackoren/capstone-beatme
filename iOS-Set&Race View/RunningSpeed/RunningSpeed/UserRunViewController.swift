//
//  ViewController.swift
//  RunningSpeed
//
//  Created by iZahi on 7/8/16.
//  Copyright © 2016 iZahi. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class UserRunViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

   

    var runnerGeoManager = CLLocationManager()
    lazy var runnerSpeed = 0.0
    lazy var runnerSpeedArray = [Double]()
    var runnerDistance = 0.0
    lazy var runnerLocations = [CLLocation]()

override func viewDidLoad() {
        SetButtonBorders(StopButton)
        SetButtonBorders(RunButton)
        SetViewButtonBorders(RunnderTime)
        SetViewButtonBorders(RunnderSpeed)
        SetViewButtonBorders(RunnderDistance)
        super.viewDidLoad()
        runnerGeoManager.delegate = self
        RunnerMap.delegate = self
        runnerGeoManager.requestWhenInUseAuthorization()
        if  CLLocationManager.locationServicesEnabled(){
            //Highest Accuracy level - check Battery performance
            runnerGeoManager.desiredAccuracy = kCLLocationAccuracyBest
            runnerGeoManager.distanceFilter = 10
            runnerGeoManager.activityType = CLActivityType.Fitness
            
        }
    }

   func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //update locations array, distance.
        for location in locations{
                if self.runnerLocations.count > 0 {
                    self.runnerDistance = runnerDistance + location.distanceFromLocation(self.runnerLocations.last!)
                    //Meters
                    self.runnerDistance = (round(runnerDistance))
                }
                self.runnerLocations.append(location)
           // }
        }
        //KM/H
        self.runnerSpeed = (round(10 * (runnerGeoManager.location!.speed * 3.6)) / 10)
        self.runnerSpeedArray.append(runnerSpeed)
        //Set runner region view
        RunnerMap.setRegion(MKCoordinateRegionMake(RunnerMap.userLocation.coordinate, MKCoordinateSpanMake(0.005, 0.005)), animated: true)
    }
    
   

    @IBOutlet weak var RunnerMap: MKMapView!
    
    @IBOutlet weak var RunnderTime: UILabel!
    
    @IBOutlet weak var RunnderDistance: UILabel!
    
    @IBOutlet weak var RunnderSpeed: UILabel!
    
    @IBOutlet weak var StopButton: UIButton!
    
    @IBOutlet weak var RunButton: UIButton!
    
    ////////////
    private var count = 0
    private var seconds = 0
    private var minutes = 0
    private var hours = 0
    private var time = NSTimer()
    private var refreshDistance = NSTimer()
    
    func RunTimer(){
        count += 1
        if count % 60 == 0{
            seconds = 0
            minutes = count/60
        }
        else{
            seconds = count%60
        }
        if (count == 3600){
            count = 0
            minutes = 0
            hours += 1
        }
        if (seconds < 10) && (minutes > 9) && (hours < 10){
            RunnderTime.text = "T-0\(hours):\(minutes):0\(seconds)"
        }
        else if (seconds < 10) && (minutes > 9) && (hours > 9){
            RunnderTime.text = "T-\(hours):\(minutes):0\(seconds)"
        }
        else if (seconds < 10) && (minutes < 10){
            RunnderTime.text = "T-0\(hours):0\(minutes):0\(seconds)"
        }
        else if (seconds > 9) && (minutes < 10){
            RunnderTime.text = "T-0\(hours):0\(minutes):\(seconds)"
        }
        else{
                RunnderTime.text = "T-0\(hours):\(minutes):\(seconds)"
        }
    }
    //////
    
    private func updateData(){
        RunnderDistance.text = "D-" + String(runnerDistance / 1000.0)
        RunnderSpeed.text = "S-\(runnerSpeed)"
    }
    
    private func SetButtonBorders(button: UIButton){
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.layer.backgroundColor = UIColor.greenColor().CGColor
    }
    
    private func SetViewButtonBorders(view: UIView){
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.blackColor().CGColor
        view.layer.backgroundColor = UIColor.greenColor().CGColor
    }
    
    @IBAction func StartRunTime(sender: UIButton) {
        //start timer - check on  a phone to see if one timer affect the other.
        time = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "RunTimer", userInfo: nil, repeats: true)
        refreshDistance =  NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateData", userInfo: nil, repeats: true)
        //RunnderDistance.text = "\(runnerDistance)"
        runnerGeoManager.startUpdatingLocation()
        }
        
    @IBAction func StopRunTime() {
        time.invalidate()
        runnerGeoManager.stopUpdatingLocation()
        //SendData(runnerSpeed,RunnerDistance,RunnerTime)
        let divide = runnerSpeedArray.count
        var sum = 0.0
        for x in runnerSpeedArray{
            sum += x
            print(x)
        }
        print(sum / Double(divide))
        print(runnerDistance)
        runnerLocations.removeAll()
        runnerSpeedArray.removeAll()
        runnerSpeed = 0.0
        runnerDistance = 0.0
        count = 0
    }
    
    
    
}

