//
//  ExtraWeatherInfoView.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/28/25.
//

import Foundation
import SwiftUI

struct ExtraWeatherInfoView: View {
    var weatherInfo: WeatherInfo
    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Text("Humidity")
                    .font(.custom("poppins.regular", size: 12))
                    .foregroundStyle(Color(#colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)))
                Text(weatherInfo.humidityString)
                    .font(.custom("poppins.regular", size: 15))
                    .foregroundStyle(Color(#colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1)))
            }
            .frame(width: 80, height: 75)
            VStack {
                Text("UV")
                    .font(.custom("poppins.regular", size: 12))
                    .foregroundStyle(Color(#colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)))
                Text(weatherInfo.uvIndexString)
                    .font(.custom("poppins.regular", size: 12))
                    .foregroundStyle(Color(#colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1)))
            }
            .frame(width: 80, height: 75)
            VStack {
                Text("Feels Like")
                    .font(.custom("poppins.regular", size: 8))
                    .foregroundStyle(Color(#colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)))
                Text(weatherInfo.feelsLikeString)
                    .font(.custom("poppins.regular", size: 12))
                    .foregroundStyle(Color(#colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1)))
            }
            .frame(width: 80)
            .frame(maxHeight: .infinity)
        }
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
        )
        .frame(width: 274, height: 75)
        .padding(.top, 16)
    }
}
