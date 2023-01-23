//
//  LocationsPreviewView.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 1/24/23.
//

import SwiftUI

struct LocationsPreviewView: View {
  
  @EnvironmentObject private var vm: LocationsViewModel
  let location: Location
  
  var body: some View {
    // Command + click -> Show SwiftUI Inspector
    HStack(alignment: .bottom, spacing: 0) {
      VStack(alignment: .leading, spacing: 16) {
        imageSection
        titleSection
      }
      
      VStack(spacing: 8) {
        learnMoreButton
        nextButton
      }
      // Used background to see the area of VStack
      //      .background(Color.orange)
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 10)
        .fill(.ultraThinMaterial)
        .offset(y: 65))
    .cornerRadius(10)
    
    // Used background to see the area of HStack
    //    .background(Color.blue)
  }
}

struct LocationsPreviewView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.green.ignoresSafeArea()
      
      LocationsPreviewView(location: LocationsDataService.locations.first!)
        .padding()
    }
    .environmentObject(LocationsViewModel())
  }
}

extension LocationsPreviewView {
  
  private var imageSection: some View {
    ZStack {
      if let imageName = location.imageNames.first {
        Image(imageName)
          .resizable()
          .scaledToFill()
          .frame(width: 100, height: 100)
          .cornerRadius(10)
      }
    }
    .padding(6)
    .background(Color.white)
    // Matches cornerRadius of image
    .cornerRadius(10)
  }
  
  private var titleSection: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(location.name)
        .font(.title2)
        .fontWeight(.bold)
      
      Text(location.cityName)
        .font(.subheadline)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var learnMoreButton: some View {
    Button {
      
    } label: {
      Text("Learn more")
        .font(.headline)
        .frame(width: 125, height: 35)
    }
    .buttonStyle(.borderedProminent)
  }
  
  private var nextButton: some View {
    Button {
      vm.nextButtonPressed()
    } label: {
      Text("Next")
        .font(.headline)
        .frame(width: 125, height: 35)
    }
    .buttonStyle(.bordered)
  }
  
}

