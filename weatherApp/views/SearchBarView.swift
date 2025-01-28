//
//  SearchBarView.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/28/25.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    @Binding var city: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
                .frame(width: 327, height: 46)

            HStack(spacing: 8) {
                TextField("Search Location", text: $city)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.leading, 12)
                    .frame(height: 46)
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 17.49, height: 17.49)
                    .padding(.trailing, 12)
                    .foregroundColor(Color(#colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)))
            }
            .frame(width: 327, height: 46)
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
    }
}
