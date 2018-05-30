//
//  WeatherDetail.swift
//  Authentic
//
//  Created by Miroslav Sliacky on 30/05/2018.
//  Copyright © 2018 AHEAD iTec, s.r.o. All rights reserved.
//

import Foundation

struct WeatherDetail: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Double?
    let wind: Wind?
    let clouds: Clouds?
    let dataTime: Double?
    let sys: Sys?
    let detailId: Double?
    let name: String?
    let cod: Double?
    
    enum CodingKeys: String, CodingKey {
        case dataTime = "dt"
        case detailId = "id"
        
        case coord, weather, base, main, visibility, wind, clouds, sys, name, cod
    }
}

struct Clouds: Codable {
    let all: Double?
}

struct Coord: Codable {
    let lon, lat: Double?
}

struct Main: Codable {
    let temp: Double?
    let humidity, pressure: Double?
    let tempMin, tempMax: Double?
    let seaLevel, grndLevel: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, humidity, pressure
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Rain: Codable {
    let the3H: Double?
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

struct Sys: Codable {
    let type, sysId: Double?
    let message: Double?
    let country: String?
    let sunrise, sunset: Double?
    
    enum CodingKeys: String, CodingKey {
        case sysId = "id"
        case type, message, country, sunrise, sunset
    }
}

struct Weather: Codable {
    let weatherId: Double?
    let main, description, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case weatherId = "id"
        case main, description, icon
    }
}

struct Wind: Codable {
    let speed, deg: Double?
}
