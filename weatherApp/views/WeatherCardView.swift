//
//  WeatherCardView.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/28/25.
//

import Foundation
import SwiftUI

struct WeatherCardView: View {
    let weatherInfo: WeatherInfo
    let onSelect: () -> Void

    var body: some View {
        Button(action: {
            onSelect()
        }) {
            HStack {
                VStack(alignment: .leading) {
                    Text(weatherInfo.cityName)
                        .foregroundStyle(Color(#colorLiteral(red: 0.2274469435, green: 0.2274469435, blue: 0.2274469435, alpha: 1)))
                        .font(.custom("poppins.regularr", size: 20))
                    Text(weatherInfo.temperatureString)
                        .foregroundStyle(Color(#colorLiteral(red: 0.2274469435, green: 0.2274469435, blue: 0.2274469435, alpha: 1)))
                        .font(.custom("poppins.regularr", size: 60))
                }
                Spacer()
                AsyncImage(url: URL(string: "https:\(weatherInfo.icon)")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 83, height: 67)
                } placeholder: {
                    ProgressView()
                }
            }
            .padding()
            .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
            .cornerRadius(16)
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.vertical)
    }
}
