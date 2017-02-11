//
//  ViewController.swift
//  Map
//
//  Created by Кирилл Рябинин on 16.12.16.
//  Copyright © 2016 Кирилл Рябинин. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    @IBAction func myL(_ sender: Any) {
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
        {
            let location = locations[0]
            let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
            
            let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude:  location.coordinate.longitude)
            
            let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
            map.setRegion(region, animated: true)
            self.map.showsUserLocation = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
