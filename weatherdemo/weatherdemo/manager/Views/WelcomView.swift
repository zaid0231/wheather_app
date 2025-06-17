//
//  WelcomView.swift
//  weatherdemo
//
//  Created by Md Zaid Ansari on 4/12/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 40){
                Text("Hello Zaid, Welcome to the weather ")
                    .bold().font(.title)
           Text(" Please share your current location")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            LocationButton(.shareCurrentLocation){
              locationManager.requestLocation()
             }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    WelcomView()
}
