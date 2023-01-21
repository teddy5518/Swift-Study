//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by TEDDY on 1/21/23.
//

import SwiftUI

// created new file exclusively to manage button
struct WeatherButton: View {
  
  var title: String
  var textColor: Color
  var backgroundColor: Color
  
  var body: some View {
    Text(title)
      .frame(width: 280, height: 50)
      .background(backgroundColor)
      .foregroundColor(textColor)
      .font(.system(size: 20, weight: .bold, design: .default))
      .cornerRadius(30)
  }
}
