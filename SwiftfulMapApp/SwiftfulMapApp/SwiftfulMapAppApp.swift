//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 1/21/23.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
  
  // Initializing view model at app level
  @StateObject private var vm = LocationsViewModel()
  
  var body: some Scene {
    WindowGroup {
      LocationsView()
      // ViewModel
        .environmentObject(vm)
    }
  }
}
