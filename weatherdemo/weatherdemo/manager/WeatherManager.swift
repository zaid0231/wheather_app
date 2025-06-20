//
//  WeatherManager.swift
//  weatherdemo
//
//  Created by Md Zaid Ansari on 4/13/25.
//

import Foundation
import CoreLocation

class WeatherManager {
    func GetWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("b479a14f815a041d0caff4e207450624")&units=metric") else {
                            fatalError("missing url")}
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard( response as? HTTPURLResponse)?.statusCode == 200 else {
             fatalError("error in fetching weather data")}
        let decodedData =  try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
    }
}
struct ResponseBody: Decodable {
    var coord: CordinatesResponse
    var weather : [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
}


extension ResponseBody.MainResponse {
    var feelsLike: Double {return feels_like}
    var tempMin: Double {return temp_min}
    var tempMax: Double {return temp_max}
}
