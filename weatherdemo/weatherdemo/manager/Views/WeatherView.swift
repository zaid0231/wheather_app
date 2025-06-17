//
//  WeatherView.swift
//  weatherdemo
//
//  Created by Md Zaid Ansari on 4/13/25.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing : 20){
                          //  Image (systemName : String)
                        }
                        .frame(width: 150, alignment: .leading)
                    }
                        Text(weather.main.feelsLike
                            .roundDouble() + "°C")
                        .font(.system(size:80))
                        .fontWeight(.bold)
                        .padding()
                    
                }
                
                   .frame(maxWidth:.infinity)
                    
                }.padding()
            
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.562, saturation: 0.513, brightness: 0.906))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
