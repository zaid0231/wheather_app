//
//  modelData.swift
//  weatherdemo
//
//  Created by Md Zaid Ansari on 4/13/25.
//
import Foundation
var previewWeather: ResponseBody = load("weatherData.json")
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in bundle.")
    }
    do {
        data = try Data(contentsOf: file) // Correct the file type here
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n \(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n \(error)")
    }
}
