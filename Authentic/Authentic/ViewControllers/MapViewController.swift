//
//  MapViewController.swift
//  Authentic
//
//  Created by Miroslav Sliacky on 30/05/2018.
//  Copyright © 2018 AHEAD iTec, s.r.o. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var doubleTapCatcher: MapViewDoubleTapCatcher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.string.localizable.m1_title()
        
        setCurrentLocation()
        
        doubleTapCatcher = MapViewDoubleTapCatcher(forMapView: mapView) { locationCoordinates in
            if let weatherDetailViewController = R.storyboard.main.weather_detail() {
                weatherDetailViewController.locationCoordinates = locationCoordinates
                self.navigationController?.pushViewController(weatherDetailViewController,
                                                              animated: true)
            }
        }
    }
    
    func setCurrentLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func centerMap(_ center: CLLocationCoordinate2D) {
        let spanX = Constants.Map.zoomSpan
        let spanY = Constants.Map.zoomSpan
        
        let newRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpanMake(spanX, spanY))
        mapView.setRegion(newRegion, animated: true)
    }
    
    @IBAction func loadLastLocation(_ sender: Any) {
        if let lastLocationWeatherDetail = WeatherDetail.cachedWeatherDetail() {
            if let weatherDetailViewController = R.storyboard.main.weather_detail() {
                weatherDetailViewController.lastWeatherDetail = lastLocationWeatherDetail
                self.navigationController?.pushViewController(weatherDetailViewController,
                                                              animated: true)
            }
        }
    }
    
    ///////////////////////////
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locationCoordinate = manager.location?.coordinate {
            centerMap(locationCoordinate)
        }
    }
}
