//
//  WeatherDetailViewController.swift
//  Authentic
//
//  Created by Miroslav Sliacky on 30/05/2018.
//  Copyright © 2018 AHEAD iTec, s.r.o. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherDetailViewController: UIViewController {

    var locationCoordinates: CLLocationCoordinate2D?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let locationCoordinates = locationCoordinates else {
            showEmptyView()
            return
        }
    }
    
    func showEmptyView() {
        title = R.string.localizable.m2_title_empty()
    }

}
