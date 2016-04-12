//
//  ViewController.swift
//  FindMyLocation <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/12.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
  
    @IBAction func getMyLocationDidClick(sender: UIButton) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.locationLabel.text = "Error while updating location " + error.localizedDescription
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placemarks?.count > 0 {
                let placemark = placemarks![0]
                self.displayLocationInfo(placemark)
            } else {
                self.locationLabel.text =  "Problem with the data received from geocoder"
            }
            
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            // stop updating location to save battery life
            locationManager.stopUpdatingLocation()
        
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            self.locationLabel.text = locality! +  postalCode! +  administrativeArea! +  country!
        }
    }

}

