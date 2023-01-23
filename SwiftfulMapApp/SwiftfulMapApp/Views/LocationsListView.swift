//
//  LocationsListView.swift
//  SwiftfulMapApp
//
//  Created by TEDDY on 1/23/23.
//

import SwiftUI

struct LocationsListView: View {
  
  @EnvironmentObject private var vm: LocationsViewModel
  
  var body: some View {
    List {
      ForEach(vm.locations) { location in
        Button {
          // To show next location when the button is clicked
          vm.showNextLocation(location: location)
        } label: {
          listRowView(location: location)
        }
          .padding(.vertical, 4)
          .listRowBackground(Color.clear)
      }
    }
    // Changing style of the list
    .listStyle(PlainListStyle())
  }
}

struct LocationsListView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsListView()
    // Preview will crash without implementing environmentObject here
      .environmentObject(LocationsViewModel())
  }
}

extension LocationsListView {
  
  // Function that accepts location
  private func listRowView(location: Location) -> some View {
    HStack {
      if let imageName = location.imageNames.first {
        Image(imageName)
          .resizable()
          .scaledToFill()
          .frame(width: 45, height: 45)
          .cornerRadius(10)
      }
      
      VStack(alignment: .leading) {
        Text(location.name)
          .font(.headline)
        Text(location.cityName)
          .font(.subheadline)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
  
  
}
