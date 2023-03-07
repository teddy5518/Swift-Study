//
//  ContentView.swift
//  Test_LeeoCalculator
//
//  Created by TEDDY on 1/22/23.
//
//  개발자리 - [Level1] 클론코딩 - 계산기앱

import SwiftUI

// Used enum to distinguish types of buttons.
enum ButtonType {
  case first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, zero
  case dot, equal, plus, minus, multiply, divide
  case percent, opposite, clear
  
  // To display buttons on the app.
  var buttonDisplayName: String {
    switch self {
    case .first:
      return "1"
    case .second:
      return "2"
    case .third:
      return "3"
    case .fourth:
      return "4"
    case .fifth:
      return "5"
    case .sixth:
      return "6"
    case .seventh:
      return "7"
    case .eighth:
      return "8"
    case .ninth:
      return "9"
    case .zero:
      return "0"
    case .dot:
      return "."
    case .equal:
      return "="
    case .plus:
      return "+"
    case .minus:
      return "-"
    case .multiply:
      return "X"
    case .divide:
      return "/"
    case .percent:
      return "%"
    case .opposite:
      return "+/-"
    case .clear:
      return "C"
    }
  }
  
  // BackgroundColor of the buttons.
  var backgroundColor: Color {
    switch self {
    case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .ninth, .zero, .dot:
      return Color("NumberButton")
    case .equal, .plus, .minus, .multiply, .divide:
      return Color.orange
    case .percent, .opposite, .clear:
      return Color.gray
    }
  }
  // ForegroundColor of the displayed buttons.
  var foregroundColor: Color {
    switch self {
    case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .ninth, .zero, .dot, .equal, .plus, .minus, .multiply, .divide:
      return Color.white
    case .percent, .opposite, .clear:
      return Color.black
    }
  }
}

struct ContentView: View {
  @State private var totalNumber: String = "0"
  @State var tempNumber: Int = 0
  @State var operatorType: ButtonType = .clear
  @State var isNotEditing: Bool = true
  
  // Actual data of the buttons.
  private let buttonData: [[ButtonType]] = [
    [.clear, .opposite, .percent, .divide],
    [.seventh, .eighth, .ninth, .multiply],
    [.fourth, .fifth, .sixth, .minus],
    [.first, .second, .third, .plus],
    [.zero, .dot, .equal],
  ]
  
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
        // Used as format of buttons in a row are repeating.
        ForEach(buttonData, id: \.self) { line in
          HStack {
            ForEach(line, id: \.self) { item in
              Button {
                
                //                  if touchCount % 2 == 0 {
                //                    // Even number turns on
                //                  } else {
                //                      // Odd number turns off
                //                  }
                
                if isNotEditing {
                  if item == .clear {
                    totalNumber = "0"
                    // To prevent inputing signs before actual numbers.
                    isNotEditing = true
                  } else if item == .plus ||
                              item == .minus ||
                              item == .multiply ||
                              item == .divide {
                    totalNumber = "Error"
                  }
                  else {
                    totalNumber = item.buttonDisplayName
                  }
                  isNotEditing = false // Already recieved inputs
                  
                } else {
                  
                  if item == .clear {
                    totalNumber = "0"
                    isNotEditing = true // Recieving inputs
                  } else if item == .plus {
                    // Store numbers
                    tempNumber = Int(totalNumber) ?? 0
                    // Add numbers
                    operatorType = .plus
                    isNotEditing = true
                  } else if item == .multiply {
                    tempNumber = Int(totalNumber) ?? 0
                    operatorType = .multiply
                    isNotEditing = true
                  } else if item == .minus {
                    tempNumber = Int(totalNumber) ?? 0
                    operatorType = .minus
                    isNotEditing = true
                  } else if item == .equal {
                    
                    if operatorType == .plus {
                      totalNumber = String((Int(totalNumber) ?? 0) + tempNumber)
                    } else if operatorType == .multiply {
                      totalNumber = String((Int(totalNumber) ?? 0) * tempNumber)
                    } else if operatorType == .minus {
                      // As the numbers are substracting, tempNumber has to come first.
                      totalNumber = String(tempNumber - (Int(totalNumber) ?? 0))
                    }
                  }
                  else {
                    totalNumber += item.buttonDisplayName
                  }
                }
              } label: {
                Text(item.buttonDisplayName)
                  .bold()
                // To distinguish other buttons from zero button.
                  .frame(width: calculateButtonWidth(button: item),
                         height: calculateButtonHeight(button: item))
                  .background(item.backgroundColor)
                  .cornerRadius(40)
                  .foregroundColor(item.foregroundColor)
                  .font(.system(size: 33))
              }
            }
          }
        }
      }
    }
  }
  
  private func calculateButtonWidth(button buttonType: ButtonType) -> CGFloat {
    switch buttonType {
    case .zero:
      return (UIScreen.main.bounds.width - 5 * 10) / 4 * 2
    default:
      // 4 Buttons and 5 blank spaces between buttons
      return ((UIScreen.main.bounds.width - 5 * 10) / 4)
    }
  }
  
  private func calculateButtonHeight(button: ButtonType) -> CGFloat {
    return (UIScreen.main.bounds.width - 5 * 10) / 4
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
