//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Ion on 2017-07-25.
//  Copyright © 2017 Ion. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!

    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // Tell Alamofire where to download file from
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            // for every request, there is a response and then a result to be used
            let result = response.result
            
            //Now we can create a dictionary
            if let dict = result.value as? Dictionary<String, AnyObject> {
            // We need to pull the data we need from the dictionary
                if let name = dict["name"] as? String {
                    //tells our fuction to search through the dictionary and find the key called name and pass the value in 
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemp = main["temp"] as? Double {
                        let kelvinToCelsius = (currentTemp - 273.15)
                        let roudedCelsiusValue = Double(round(kelvinToCelsius*100)/100)
                        self._currentTemp = roudedCelsiusValue
                        print(self._currentTemp)
                    }
                }
                
            }
           completed()
        }
        
    }
    
    
}
