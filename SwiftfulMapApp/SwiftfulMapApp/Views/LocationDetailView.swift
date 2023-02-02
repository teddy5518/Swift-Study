//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 2/2/23.
//

import SwiftUI

struct LocationDetailView: View {
  
  // Initializing
  let location: Location
  
  var body: some View {
    ScrollView {
      VStack {
        TabView {
          ForEach(location.imageNames, id: \.self) {
            Image($0)
              .resizable()
              .scaledToFill()
          }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
        
        
      }
    }
    // To push image to the top
    .ignoresSafeArea()
  }
}

struct LocationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LocationDetailView(location: LocationsDataService.locations.first!)
  }
}
