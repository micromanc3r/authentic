//
//  Constants.swift
//  Authentic
//
//  Created by Miroslav Sliacky on 30/05/2018.
//  Copyright © 2018 AHEAD iTec, s.r.o. All rights reserved.
//

import Foundation

struct Constants {
    struct MapAPI {
        static let url = "https://api.openweathermap.org/data/2.5/weather"
        static let apiKey = "52f9c11a6af725bd6473ce371beb123b"
    }
    
    struct Cache {
        static let lastRequestKey = "last_weather_detail_key"
    }
    
    struct Map {
        static let zoomSpan = 0.7
    }
}
