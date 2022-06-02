//
//  ContentView.swift
//  WeSplit
//
//  Created by Zeliha Uslu on 1.06.2022.
//

import SwiftUI



struct ContentView : View{
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    
    var totalPerPerson: Double{
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100.0 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    let tipPercentages = [10, 15, 20, 25, 50, 0]
    
    var body: some View{
        NavigationView {
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currencyCode ?? "USD"))

                              Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                              }
                    
                }
                Section{
//                    Text("How much tip do you want to leave?")
                    Picker("Tip Percentage: ", selection: $tipPercentage){
                        ForEach(tipPercentages, id:\.self){
                            Text($0, format: .percent)
                            
                                
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                }
            }.navigationTitle("WeSplit")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer() //trailing
                        Button("Done"){
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
    
//    func zero() -> Bool{
//        ti
//    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
