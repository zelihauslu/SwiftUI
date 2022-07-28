//
//  ContentView.swift
//  MultipleLanguage
//
//  Created by Zeliha Uslu on 28.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.brown
                .ignoresSafeArea(.all)
            VStack{
                Text(LocalizedStringKey("welcome"))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                
                Text(LocalizedStringKey("hello"))
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    
                    
                Button {
                    //
                } label: {
                    Text(LocalizedStringKey("clickMe"))
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.orange)
                        .cornerRadius(16)
                    
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
