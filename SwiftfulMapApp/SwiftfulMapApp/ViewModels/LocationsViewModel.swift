//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 1/23/23.
//

import Foundation
import MapKit
import SwiftUI

// ObservableObject is used as we need to observe the object from the view
class LocationsViewModel: ObservableObject {
  
  // All loaded locations
  @Published var locations: [Location]
  
  // Current location on the map
  @Published var mapLocation: Location {
    // To automatically update mapRegion when mapLocation is upadated
    didSet {
      updateMapRegion(location: mapLocation)
    }
  }
  
  // File missing MKCoordinateRegion, thus importing MapKit is required
  // Current region on map
  @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
  let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
  
  // Show list of locations
  @Published var showLocationsList: Bool = false
  
  init() {
    let locations = LocationsDataService.locations
    self.locations = locations
    self.mapLocation = locations.first!
    
    self.updateMapRegion(location: locations.first!)
  }
  
  private func updateMapRegion(location: Location) {
    // SwiftUI is required to use withAnimation feature
    withAnimation(.easeInOut) {
      mapRegion = MKCoordinateRegion(
        // Center locations of the map
        center: location.coordinates,
        // Map to be zoomed in or zoomed out
        span: mapSpan)
    }
  }
  
  func toggleLocationList() {
    withAnimation(.easeInOut) {
      // showLocationsList.toggle() is also available
      showLocationsList = !showLocationsList
    }
  }
  
  func showNextLocation(location: Location) {
    withAnimation(.easeInOut) {
      mapLocation = location
      showLocationsList = false
    }
  }
  
}
