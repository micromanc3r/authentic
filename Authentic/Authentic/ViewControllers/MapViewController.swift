//
//  MapViewController.swift
//  Authentic
//
//  Created by Miroslav Sliacky on 30/05/2018.
//  Copyright © 2018 AHEAD iTec, s.r.o. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var doubleTapCatcher: MapViewDoubleTapCatcher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.string.localizable.m1_title()
        
        doubleTapCatcher = MapViewDoubleTapCatcher(forMapView: mapView) { _ in
            if let weatherDetailViewController = R.storyboard.main.weather_detail() {
                self.navigationController?.pushViewController(weatherDetailViewController,
                                                              animated: true)
            }
        }
    }
}
