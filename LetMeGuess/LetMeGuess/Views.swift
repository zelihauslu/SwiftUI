//
//  Views.swift
//  LetMeGuess
//
//  Created by Zeliha Uslu on 1.06.2022.
//

import SwiftUI

struct GridStack<Content: View>: View{
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    var body: some View{
        VStack {
            ForEach(0..<rows, id:\.self) {row in
                                HStack {
                ForEach(0..<columns, id:\.self) { column in
                    content (row, column)
                }
            }
    }
}
    }
}

   
                            
                            
            struct Views: View {
            var body: some View {
                VStack{
                    
                    Button("Button 1", role: .destructive){}
                        .buttonStyle(.bordered)
                    Button("Button 2"){}
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                    Button("Button 3"){}
                        .buttonStyle(.bordered)
                    Button("Button 4", role: .destructive){}
                        .buttonStyle(.borderedProminent)
                    HStack {
                        Image("bird")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                        Image("bird")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
                            
                            struct alert : View{
            @State private var showAlert : Bool = false
            var body: some View{
                Button("Show Alert"){
                    showAlert = true
                }
                .alert("Important Message", isPresented: $showAlert){
                    Button("Delete", role: .destructive){}
                    Button("Cancel", role: .cancel){}
                } message: {
                    Text("Please read this")
                }
            }
        }
                            
                            struct Views_Previews: PreviewProvider {
            static var previews: some View {
                GridStack(rows: 4, columns: 4){ row, col in
                    HStack {
                        Image(systemName: "\(row * 4 + col).circle")
                        Text("R\(row), C\(col)")
                    }
                }
            }
        }
