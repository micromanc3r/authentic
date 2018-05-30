//
//  WeatherDetailCache.swift
//  Authentic
//
//  Created by Miroslav Sliacky on 31/05/2018.
//  Copyright © 2018 AHEAD iTec, s.r.o. All rights reserved.
//

import Foundation

extension WeatherDetail {
    func cache() {
        if let encodedSelf = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encodedSelf, forKey: Constants.Cache.lastRequestKey)
        }
    }
    
    func cachedWeatherDetail() -> WeatherDetail? {
        guard let data = UserDefaults.standard.data(forKey: Constants.Cache.lastRequestKey) else {
            return nil
        }
        
        return try? JSONDecoder().decode(WeatherDetail.self, from: data)
    }
}
