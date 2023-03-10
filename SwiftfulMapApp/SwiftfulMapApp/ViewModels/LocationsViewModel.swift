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
  
  // Show location detail via sheet
  // Needs to be optional
  @Published var sheetLocation: Location? = nil
  
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
  
  func nextButtonPressed() {
    
    // Get the current index
    guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
      print("Could not find current index in locations array! Should never happen.")
      return
    }
    
    // Check if the nextIndex is valid
    let nextIndex = currentIndex + 1
    guard locations.indices.contains(nextIndex) else {
      // Next index is NOT valid
      // Restart from 0
      guard let firstLocation = locations.first else { return }
      showNextLocation(location: firstLocation)
      return
    }
    
    // Next index IS valid
    let nextLocation = locations[nextIndex]
    showNextLocation(location: nextLocation)
  }
  
}
