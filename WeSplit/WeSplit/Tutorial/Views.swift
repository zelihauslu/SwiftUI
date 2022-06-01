//
//  Views.swift
//  WeSplit
//
//  Created by Zeliha Uslu on 1.06.2022.
//

import SwiftUI
// MARK: PICKER
struct Views: View {
  @State private var fruits = [
    "Strawberry", "Peach", "Cherry"
    ]
    @State private var selectedFruit = "Strawberry"
    var body: some View {
        NavigationView{
            Form{
                Picker("Select your fruit: ", selection: $selectedFruit){
                    ForEach(fruits, id:\.self){
                        Text($0)
                    }
                }
            }.navigationTitle("Fruits")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct Views_Previews: PreviewProvider {
    static var previews: some View {
        Views()
    }
}
