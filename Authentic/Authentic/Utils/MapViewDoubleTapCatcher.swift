//
//  MapViewDoubleTapCatcher.swift
//  Authentic
//
//  Created by Miroslav Sliacky on 30/05/2018.
//  Copyright © 2018 AHEAD iTec, s.r.o. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapViewDoubleTapCatcher: NSObject, UIGestureRecognizerDelegate {
    
    let doubleTapAction: (CLLocationCoordinate2D) -> Void
    let mapView: MKMapView
    
    var doubleTapRecognizer: UITapGestureRecognizer?
    
    init(forMapView mapView: MKMapView, doubleTapAction: @escaping (CLLocationCoordinate2D) -> Void) {
        self.doubleTapAction = doubleTapAction
        self.mapView = mapView
        super.init()
        
        doubleTapRecognizer = UITapGestureRecognizer(target: self,
                                                     action: #selector(doubleTap))
        
        if let doubleTapRecognizer = doubleTapRecognizer {
            doubleTapRecognizer.numberOfTapsRequired = 2
            doubleTapRecognizer.numberOfTouchesRequired = 1
            doubleTapRecognizer.delegate = self
            
            mapView.addGestureRecognizer(doubleTapRecognizer)
        }
    }
    
    @objc func doubleTap() {
        if let touchCoordinates = getTouchCoordinates() {
            doubleTapAction(touchCoordinates)
        }
    }
    
    func getTouchCoordinates() -> CLLocationCoordinate2D? {
        guard let doubleTapRecognizer = doubleTapRecognizer else {
            return nil
        }
        
        let touchPoint = doubleTapRecognizer.location(in: mapView)
        return mapView.convert(touchPoint,
                               toCoordinateFrom: mapView)
    }
    
    ///////////////////////////
    // MARK: - UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // for map view to not capture the double tap
        return true
    }
}
