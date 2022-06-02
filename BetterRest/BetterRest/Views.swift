//
//  Views.swift
//  BetterRest
//
//  Created by Zeliha Uslu on 2.06.2022.
//

import SwiftUI

struct Views: View {
    @State var sleepAmount : Double = 8.0
    @State var wakeUp = Date.now
    
    var body: some View {
        VStack{
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a time", selection: $wakeUp, /*displayedComponents: .hourAndMinute*/ in: Date.now...)
            
            Text(Date.now.formatted(date: .long, time: .omitted ))
//            Text(Date.now, format: .dateTime.day().month())
        }            .padding()
        

        
    }
     
    func trivialExample(){
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date.now
        
//        let now = Date.now
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = now...tomorrow
    }
}

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        Views()
    }
}
