//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 1/21/23.
//

import Foundation
import MapKit

struct Location {
  let name: String
  let cityName: String
  // CL stands for core location
  // importing mapkit is required to use CL feature
  let coordinates: CLLocationCoordinate2D
  let description: String
  let imageNames: [String]
  let link: String
}
