//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 2/2/23.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
  
  @EnvironmentObject private var vm: LocationsViewModel
  let location: Location
  
  var body: some View {
    ScrollView {
      VStack {
        imageSection
          .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        
        VStack(alignment: .leading, spacing: 16) {
          titleSection
          Divider()
          descriptionSection
          Divider()
          mapLayer
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
      }
    }
    // To push image to the top
    .ignoresSafeArea()
    .background(.ultraThinMaterial)
    .overlay(backButton, alignment: .topLeading)
  }
}

struct LocationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LocationDetailView(location: LocationsDataService.locations.first!)
      .environmentObject(LocationsViewModel())
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
        // Setting frame for devices
          .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
          .clipped()
      }
    }
    .frame(height: 500)
    .tabViewStyle(PageTabViewStyle())
  }
  
  private var titleSection: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(location.name)
        .font(.largeTitle)
        .fontWeight(.semibold)
      Text(location.cityName)
        .font(.title3)
      // Primary and secondary adopts to dark mode automatically.
        .foregroundColor(.secondary)
    }
  }
  
  private var descriptionSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text(location.description)
        .font(.subheadline)
        .foregroundColor(.secondary)
      
      // To return url as string
      // url is optional
      if let url = URL(string: location.link) {
        Link("Read more on Wikipedia", destination: url)
          .font(.headline)
          .tint(.blue)
      }
    }
  }
  
  private var mapLayer: some View {
    Map(coordinateRegion: .constant(MKCoordinateRegion(
      center: location.coordinates,
      span: MKCoordinateSpan(latitudeDelta: 0.01,
                             longitudeDelta: 0.01))),
        annotationItems: [location]) { location in
      MapAnnotation(coordinate: location.coordinates) {
        LocationMapAnnotationView()
          .shadow(radius: 10)
      }
    }
    // Disable hit gesture
    .allowsHitTesting(false)
    // 1 to 1 ratio for height and width
    .aspectRatio(1, contentMode: .fit)
    .cornerRadius(30)
  }
  
  private var backButton: some View {
    Button {
      vm.sheetLocation = nil
    } label: {
      Image(systemName: "xmark")
        .font(.headline)
        .padding(16)
        .foregroundColor(.primary)
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(radius: 4)
        .padding()
    }
    
  }
}
