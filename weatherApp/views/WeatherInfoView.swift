//
//  WeatherInfoView.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/28/25.
//

import Foundation
import SwiftUI

struct WeatherInfoView: View {
    var weatherInfo: WeatherInfo
    
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                AsyncImage(url: URL(string: "https:\(weatherInfo.icon)")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 123, height: 123)
                } placeholder: {
                    ProgressView()
                }
                
                HStack {
                    Text(weatherInfo.cityName)
                        .foregroundStyle(Color(#colorLiteral(red: 0.2274469435, green: 0.2274469435, blue: 0.2274469435, alpha: 1)))
                        .font(.custom("poppins.regularr", size: 30))
                    Image("Vector")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 21, height: 21)
                }
                
                ZStack(alignment: .topTrailing) {
                    Text(weatherInfo.temperatureString)
                        .foregroundStyle(Color(#colorLiteral(red: 0.2274469435, green: 0.2274469435, blue: 0.2274469435, alpha: 1)))
                        .font(.custom("poppins.regular", size: 70))
                        .font(.title)
                    
                    Image("Ellipse")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .offset(x: 8, y: 12)
                }
            }
            .padding()
            
            ExtraWeatherInfoView(weatherInfo: weatherInfo)
            
        }
    }
}
