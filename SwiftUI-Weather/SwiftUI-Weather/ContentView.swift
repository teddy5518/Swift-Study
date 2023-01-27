//
//  RefactoringView.swift
//  SwiftUI-Weather
//
//  Created by TEDDY on 1/21/23.
//
//  Sean Allen - SwiftUI Basics Tutorial

import SwiftUI

// struct is a value type
struct ContentView: View {
  // boolean waiting for the changes
  @State private var isNight = false
  
  var body: some View {
    ZStack {
      // ternary operator to manage both conditions
      BackgroundView(isNight: $isNight)
      VStack {
        CityTextView(cityName: "Cupertino, CA")
        
        MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :
                                "cloud.sun.fill",
                              temperature: 76)
        
        // spacing provides space between each contents in the stack
        HStack(spacing: 20) {
          WeatherDayView(dayOfweek: "TUE",
                          imageName: "cloud.sun.fill",
                          temperature: 74)
          
          WeatherDayView(dayOfweek: "WED",
                          imageName: "sun.max.fill",
                          temperature: 88)
          
          WeatherDayView(dayOfweek: "THU",
                          imageName: "wind.snow",
                          temperature: 55)
          
          WeatherDayView(dayOfweek: "FRI",
                          imageName: "sunset.fill",
                          temperature: 60)
          
          WeatherDayView(dayOfweek: "SAT",
                          imageName: "snow",
                          temperature: 25)
        }
        
        // spacer counts as a view
        Spacer()
        
        Button {
          isNight.toggle()
        } label: {
          WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
        }
        
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// command + click -> extract subview creates structure automatically
// extract subview could be renamed
// reusable dayView
struct WeatherDayView: View {
  
  // these variables will be changed throughout the usage
  var dayOfweek: String
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack {
      Text(dayOfweek)
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .medium, design: .default))
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
        .font(.system(size: 32, weight: .medium, design: .default))
      Text("\(temperature)°")
        .foregroundColor(.white)
        .font(.system(size: 28, weight: .medium))
    }
  }
}

struct BackgroundView: View {
  
  // binding will be same as the state value
  @Binding var isNight: Bool
  
  var body: some View {
    // Setting gradient of the view
    // colors of gradient can be added as much as I want
    // asset color could be added into the gradient
    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
    .edgesIgnoringSafeArea(.all)
  }
}

struct CityTextView: View {
  
  var cityName: String
  
  var body: some View {
    Text(cityName)
    // setting font style
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {
  
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: imageName)
      // renderingMode provides multicolor to the icon
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
      
      // option + shift + 8 prints °
      Text("\(temperature)°")
      // option + enter to insert all prameters
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
    }
    .padding(.bottom, 40)
  }
}
