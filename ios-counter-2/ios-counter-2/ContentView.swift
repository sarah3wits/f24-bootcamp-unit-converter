//
//  ContentView.swift
//  ios-counter-2
//
//  Created by Sarah Threewits on 10/1/24.
//


import SwiftUI

struct ContentView: View {
    @State var inputValue = 0.0
    @State var inputUnit = "mL"
    @State var outputUnit = "mL"
    @State var outputValue = 0.0
  
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    var inputUnitToMilliliter: Double {
        switch inputUnit {
        case "mL":
            return inputValue
        case "Liters":
            return literToMilliliter * inputValue
        case "Cups":
            return cupToMilliliter * inputValue
        case "Pints":
            return pintToMilliliter * inputValue
        case "Gallons":
            return gallonToMilliliter * inputValue
        default:
            return inputValue * gallonToMilliliter
            }
        }
    
  /*  var output: Double {
        switch inputUnit {
        case "mL":
            return inputUnitToMilliliter
        case "Liters":
            return literToMilliliter / inputValue
        case "Cups":
            return cupToMilliliter / inputValue
        case "Pints":
            return pintToMilliliter / inputValue
        case "Gallons":
            return gallonToMilliliter /inputValue
        default:
            return inputValue /gallonToMilliliter
            }
        }
    */
    
  var body: some View {
      NavigationStack {
          Form {
              Section("Input Value and Unit:") {
                  TextField("Input Value", value: $inputValue, format: .number)
                  
                  Picker("Unit", selection: $inputUnit) {
                      ForEach(units, id: \.self) { unit in
                          Text(unit)
                      }
                  }
                  .pickerStyle(.segmented)
              }
                  
              Section("Convert to:") {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                .pickerStyle(.segmented)
                  
                Section("Output") {
                    Text("")
                }
            }
            .navigationTitle("Volume Converter")
        }
    }
}

#Preview {
    ContentView()
}
