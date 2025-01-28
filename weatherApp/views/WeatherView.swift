//
//  ContentView.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/27/25.
//

import SwiftUI
import Foundation
import Factory

struct WeatherView: View {
    @StateObject private var viewModel = Container.shared.weatherViewmodel()

    var body: some View {
        VStack {
            SearchBarView(city: $viewModel.city)
            switch viewModel.screenState {
            case .card:
                if let weatherInfo = viewModel.weatherInfo {
                    WeatherCardView(weatherInfo: weatherInfo) {
                        viewModel.saveSelectedCity() // Save selected city
                    }
                }
            case .info:
                if let weatherInfo = viewModel.weatherInfo {
                    WeatherInfoView(weatherInfo: weatherInfo)
                }
            case .enterCity:
                VStack(spacing: 12) {
                    Spacer()
                    Text("No City Selected")
                        .foregroundStyle(Color(#colorLiteral(red: 0.2274469435, green: 0.2274469435, blue: 0.2274469435, alpha: 1)))
                        .font(.custom("poppins.regular", size: 30))
                    Text("Please Search For A City")
                        .foregroundStyle(Color(#colorLiteral(red: 0.2274469435, green: 0.2274469435, blue: 0.2274469435, alpha: 1)))
                        .font(.custom("poppins.regular", size: 15))
                    Spacer()
                }
            }
            Spacer()
            
        }
        .padding()
    }
}
#Preview {
    WeatherView()
}
