//
//  ContentView.swift
//  Test_LeeoCalculator
//
//  Created by TEDDY on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          HStack {
            Text("7")
            Text("8")
            Text("9")
            Text("X")
          }
          
          HStack {
            Text("4")
            Text("5")
            Text("6")
            Text("-")
          }
          
          HStack {
            Text("1")
            Text("2")
            Text("3")
            Text("+")
          }
          
          HStack {
            Text("0")
            Text("0")
            Text(".")
            Text("=")
          }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
