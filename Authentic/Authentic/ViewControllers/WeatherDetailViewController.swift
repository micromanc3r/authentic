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
    let downloader = WeatherDetailDownloader()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let locationCoordinates = locationCoordinates else {
            showEmptyView()
            return
        }
        
        downloader.getWeather(forLocation: locationCoordinates) {[weak self] _, weatherDetail in
            if let weatherDetail = weatherDetail {
                self?.show(weatherDetail)
            } else {
                self?.showEmptyView()
                return
            }
        }
    }
    
    func showEmptyView() {
        title = R.string.localizable.m2_title_empty()
    }
    
    func show(_ weatherDetail: WeatherDetail) {
        title = weatherDetail.name ?? R.string.localizable.m2_title_noname()
    }

}
