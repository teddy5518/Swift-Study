//
//  LocationMapAnnotationView.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 1/29/23.
//

import SwiftUI

struct LocationMapAnnotationView: View {
  
  // Importing color from asset
  let accentColor = Color("AccentColor")
  
  var body: some View {
    VStack (spacing: 0) {
      Image(systemName: "map.circle.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 30, height: 30)
        .font(.headline)
        .foregroundColor(.white)
        .padding(6)
        .background(accentColor)
        .cornerRadius(36)
      
      // Two images can be combined to create a custom image
      Image(systemName: "triangle.fill")
        .resizable()
        .scaledToFit()
        .foregroundColor(accentColor)
        .frame(width: 10, height: 10)
        .rotationEffect(Angle(degrees: 180))
        .offset(y: -3)
        // To prevent image to be right on the map
        .padding(.bottom, 40)
    }
  }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      LocationMapAnnotationView()
    }
  }
}
