//
//  ContentView.swift
//  converter
//
//  Created by Marvin John on 07.07.24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ConverterViewModel()
    @FocusState var isFocused: Bool
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    InputView(vm: vm)
                    
                    InputUnitsView(vm: vm)
                    
                    OutputUnitsView(vm: vm)
                    
                    OutputView(vm: vm)
                    
                    Button("Submit") {
                        vm.convert()
                        isFocused = false
                    }
                   
                }
               
            }
            .navigationTitle("Unit Converter")
        }
        
        
    }
}


#Preview {
    ContentView()
}

struct InputView: View {
    @ObservedObject var vm: ConverterViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        Section("Input") {
            TextField("", text: $vm.inputNumber)
                .keyboardType(.numberPad)
                .focused(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=$isFocused@*/FocusState<Bool>().projectedValue/*@END_MENU_TOKEN@*/)
        }
    }
}


struct InputUnitsView: View {
    @ObservedObject var vm: ConverterViewModel
    var body: some View {
        Section("Input Units") {
            Picker("", selection: $vm.selectedInputUnit) {
                ForEach(vm.inputUnits, id: \.self){ unit in
                    Text(unit)
                }
            }
            .pickerStyle(.segmented)
        }
        
    }
}

struct OutputUnitsView: View {
    @ObservedObject var vm: ConverterViewModel
    var body: some View {
        Section("Output Units") {
            Picker("", selection: $vm.selectedOutputUnit){
                ForEach(vm.outputUnits, id: \.self) { unit in
                    Text(unit)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct OutputView: View {
    @ObservedObject var vm: ConverterViewModel
    var body: some View {
        Section("Output") {
            TextField("", text: $vm.outputNumber)
        }
    }
}

