//
//  ConverterViewModel.swift
//  converter
//
//  Created by Marvin John on 07.07.24.
//

import Foundation

class ConverterViewModel: ObservableObject{
    @Published var inputNumber = ""
    @Published var selectedInputUnit = "Meter"
    @Published var selectedOutputUnit = "Kilometer"
    @Published var outputNumber = ""
    
    let inputUnits = ["Meter", "Kilometer", "m/s", "km/h"]
    let outputUnits = ["Meter", "Kilometer", "m/s", "km/h"]
    
    func convert(){
        let newInput = Double(inputNumber) ?? 0
        
      
        
        if selectedInputUnit == "Meter" && selectedOutputUnit == "Kilometer"{
            let result = newInput / 1000.0
            outputNumber = String(result)
            
            
        }  else if selectedInputUnit == "Kilometer" && selectedOutputUnit == "Meter"{
            let result = newInput * 1000.0
            outputNumber = String(result)
            
        } else if selectedInputUnit == "m/s" && selectedOutputUnit == "km/h"{
            let result = newInput * 3.6
            outputNumber = String(result)
            
        } else if selectedInputUnit == "km/h" && selectedOutputUnit == "m/s"{
            let result = newInput / 3.6
            outputNumber = String(result)
            
        }  else {
           outputNumber = "Dumbass"
        }
        
       
    }
}

