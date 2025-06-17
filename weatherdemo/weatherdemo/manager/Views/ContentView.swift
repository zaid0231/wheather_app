//
//  ContentView.swift
//  weatherdemo
//
//  Created by Md Zaid Ansari on 4/12/25.
//

import SwiftUI

    

struct ContentView: View {
    @StateObject var loactionManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    
    var body: some View {
        VStack {
            if let location = loactionManager.location {
                if let weather = weather{
                   WeatherView (weather: weather)
                }
                else{
                    LoadingView()
                        .task {
                            do{
                               weather = try await self.weatherManager.GetWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Error fetching weather : \(error)")
                            }
                        }
                }
                //    Text(" Your Location is: \(location.longitude), \(location.latitude)")
            }
            else{
                if loactionManager.isloading {
                    LoadingView()
                }else{
                    WelcomView()
                        .environmentObject(loactionManager)
                }
            }
        
        }
        .background(Color(hue: 0.562, saturation: 0.513, brightness: 0.906))
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
