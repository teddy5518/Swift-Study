//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 2/2/23.
//

import SwiftUI

struct LocationDetailView: View {
  let location: Location
  
  var body: some View {
    ScrollView {
      VStack {
        imageSection
        
    
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

extension LocationDetailView {
  
  private var imageSection: some View {
    TabView {
      // Needs to use initializer that has id
      ForEach(location.imageNames, id: \.self) {
        // To reference each image that we are looping on
        Image($0)
          .resizable()
          .scaledToFill()
          // To remove weird loading delay between swipes
          .frame(width: UIScreen.main.bounds.width)
          .clipped()
      }
    }
    .frame(height: 500)
    .tabViewStyle(PageTabViewStyle())
  }
  
}
