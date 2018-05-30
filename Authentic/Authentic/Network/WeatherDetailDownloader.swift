//
//  WeatherDetailDownloader.swift
//  Authentic
//
//  Created by Miroslav Sliacky on 30/05/2018.
//  Copyright © 2018 AHEAD iTec, s.r.o. All rights reserved.
//

import Foundation
import CoreLocation

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func weatherDetailTask(with url: URL, completionHandler: @escaping (WeatherDetail?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

class WeatherDetailDownloader {
    
    let downloadSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func getWeather(forLocation location: CLLocationCoordinate2D, completion: @escaping (Error?, WeatherDetail?) -> Void) {
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: Constants.MapAPI.url) {
            urlComponents.query = "lat=\(location.latitude)&lon=\(location.longitude)&units=metric&APPID=\(Constants.MapAPI.apiKey)"
            
            guard let url = urlComponents.url else {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
                return
            }
            
            dataTask = downloadSession.weatherDetailTask(with: url) { (weatherDetail, _, error) in
                defer {
                    self.dataTask = nil
                }
                
                // handle error
                if let error = error {
                    print("DataTask error: " + error.localizedDescription + "\n")
                    DispatchQueue.main.async {
                        completion(error, nil)
                    }
                    return
                }
                
                // handle result
                DispatchQueue.main.async {
                    completion(nil, weatherDetail)
                }
            }
            dataTask?.resume()
        }
    }
}
