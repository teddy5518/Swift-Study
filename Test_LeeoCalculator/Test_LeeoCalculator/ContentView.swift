//
//  ContentView.swift
//  Test_LeeoCalculator
//
//  Created by TEDDY on 1/22/23.
//
//  개발자리 - [Level1] 클론코딩 - 계산기앱

import SwiftUI

struct ContentView: View {
  
  @State private var totalNumber: String = "0"
  
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      
      VStack {
        Spacer()
        HStack {
          Spacer()
          Text(totalNumber)
            .padding()
            .font(.system(size: 73))
            .foregroundColor(.white)
        }
        HStack {
          Button {
            
          } label: {
            Text("C")
              .frame(width: 80, height: 80)
              .background(.gray)
              .cornerRadius(40)
              .foregroundColor(.white)
              .font(.system(size: 33))
          }
          
          Text("+/-")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("%")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("$")
            .frame(width: 80, height: 80)
            .background(.orange)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
        }
        
        HStack {
          Button {
            if totalNumber == "0" {
              totalNumber = "7"
            } else {
              totalNumber += "7"
            }
          } label: {
            Text("7")
              .frame(width: 80, height: 80)
              .background(Color("NumberButton"))
              .cornerRadius(40)
              .foregroundColor(.white)
              .font(.system(size: 33))
          }
          
          Text("8")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("9")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("X")
            .frame(width: 80, height: 80)
            .background(.orange)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
        }
        
        HStack {
          Text("4")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("5")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("6")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("-")
            .frame(width: 80, height: 80)
            .background(.orange)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
        }
        
        HStack {
          Text("1")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("2")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("3")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("+")
            .frame(width: 80, height: 80)
            .background(.orange)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
        }
        
        HStack {
          Text("0")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("0")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text(".")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
          Text("=")
            .frame(width: 80, height: 80)
            .background(.orange)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))
        }
      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
