//
//  noItemsView.swift
//  SwiftUIExe.
//
//  Created by Zeliha Uslu on 25.05.2022.
//

import SwiftUI

struct noItemsView: View {
    @State var animate: Bool = false
    @State var secondaryAccentColor = Color("secondaryAccentColor")

    var body: some View {
        
        ScrollView {
            VStack(spacing: 10) {
                Text("Here is empty🫠")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are u a productive person? I think u should click the add button and add a bunch of items to your todo list!  ")
                    .padding(.bottom, 20)
                NavigationLink(
                            destination: AddView(),
                            label: {
                    Text("Add something🤸🏻")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                                    .background(animate ? secondaryAccentColor : Color.accentColor)
                                    .cornerRadius(20)
                }) .padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? secondaryAccentColor : Color.accentColor.opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0,
                            y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -5 : 0)
            } .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(Animation.easeInOut(duration: 2.0)
                .repeatForever()){
                animate.toggle()
            }
        }
    }
    
}

struct noItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            noItemsView()
                .navigationTitle("Title")
        }
    }
}
