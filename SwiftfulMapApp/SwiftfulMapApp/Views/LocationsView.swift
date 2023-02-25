//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 1/23/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
  
  // View has a reference to the LocationsViewModel
  @EnvironmentObject private var vm: LocationsViewModel
  // Declaring max width for IPad
  let maxWidthForIpad: CGFloat = 700
  
  var body: some View {
    ZStack {
      mapLayer
        .ignoresSafeArea()
      
      VStack(spacing: 0) {
        header
          .padding()
          .frame(maxWidth: maxWidthForIpad)
        
        Spacer()
        locationsPreviewStack
      }
    }
    .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
      LocationDetailView(location: location)
    }
  }
}

struct LocationsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsView()
    // Preview will crash without implementing environmentObject here
      .environmentObject(LocationsViewModel())
  }
}

// Extension is continuation of the current struct
// Extension helps body to be highly readable
extension LocationsView {
  
  private var header: some View {
    VStack {
      Button(action: vm.toggleLocationList) {
        // Displays current location
        Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
          .font(.title2)
          .fontWeight(.black)
          .foregroundColor(.primary)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
        // To not have animation effect
          .animation(.none, value: vm.mapLocation)
          .overlay(alignment: .leading) {
            Image(systemName: "arrow.down")
              .font(.headline)
              .foregroundColor(.primary)
              .padding()
            // To display if list is showing
              .rotationEffect(Angle(degrees:
                                      vm.showLocationsList ? 180 : 0))
          }
      }
      
      if vm.showLocationsList {
        LocationsListView()
      }
    }
    // Material adds blurry layer between view and background
    .background(.thickMaterial)
    .cornerRadius(10)
    .shadow(color: .black.opacity(0.3), radius: 20, x: 10, y: 15)
  }
  
  private var mapLayer: some View {
    // Command + Shift + O -> Search: ForEach -> Provides official document
    // annotiationItems allows to pin on the map
    Map(coordinateRegion: $vm.mapRegion,
        annotationItems: vm.locations,
        annotationContent: { location in
      // Customize annotaion
      MapAnnotation(coordinate: location.coordinates) {
        LocationMapAnnotationView()
        // Making current location pin to be bigger than other pins
          .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
          .shadow(radius: 10)
        // To change current location by clicking map
          .onTapGesture {
            vm.showNextLocation(location: location)
          }
      }
    })
  }
  
  private var locationsPreviewStack: some View {
    ZStack {
      ForEach(vm.locations) { location in
        // To draw one preview at a time
        if vm.mapLocation == location {
          LocationsPreviewView(location: location)
            .shadow(color: Color.black.opacity(0.3), radius: 20)
            .padding()
            .frame(maxWidth: maxWidthForIpad)
            // Animation moves from edge of Max width for Ipad, thus another frame is required.
            .frame(maxWidth: .infinity)
          // Transition between changes
            .transition(.asymmetric(
              insertion: .move(edge: .trailing),
              removal: .move(edge: .leading)))
        }
      }
    }
  }
  
}

