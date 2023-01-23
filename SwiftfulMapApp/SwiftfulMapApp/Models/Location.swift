//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 1/21/23.
//

import Foundation
import MapKit

// Equatable returns a Boolean value indicating whether two values are equal
struct Location: Identifiable, Equatable {
  
  let name: String
  let cityName: String
  // CL stands for core location
  // importing mapkit is required to use CL feature
  let coordinates: CLLocationCoordinate2D
  let description: String
  let imageNames: [String]
  let link: String
  
  /*
   To use Identifiable, id is required. Same name could be used multiple times due to the purpose of the app. Thus, id variable was created instead of implementing UUID.
   */
  var id: String {
    // name = "Colosseum"
    // cityName = "Rome"
    // id = "ColosseumRome"
    name + cityName
  }
  
  // Equatable
  static func == (lhs: Location, rhs: Location) -> Bool {
    lhs.id == rhs.id
  }
  
}
