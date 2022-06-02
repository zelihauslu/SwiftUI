//
//  ContentView.swift
//  LetMeGuess
//
//  Created by Zeliha Uslu on 1.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var showingScore = false
    @State var scoreTitle = ""
    @State private var showingGameOverAlert = false
    @State private var questionCount = 0
    
    @State var paintings = ["monaLisa", "nedimeler", "pearl", "derKuss", "venus", "theLastSupper", "threePujarins", "WhistlersMother"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State var score : Int = 0
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.brown, .white], startPoint: .bottomLeading, endPoint: .top)
            VStack{
                VStack{
                    Text("Tap the painting of :")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.brown)
                        .padding()
                        .cornerRadius(20)
                    Text(paintings[correctAnswer])
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.brown, lineWidth: 2)
                        )
                        .padding(.bottom)
                }
                
                VStack {
                    ForEach(0..<3){ number in
                        Button{
                            paintingTapped(number)
                        }label: {
                            Image(paintings[number])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .padding(10)
                                .background(.brown)
                        }
                    }
                }
                Text("Score: \(score)")
                    .padding()
            }
            .alert(scoreTitle, isPresented: $showingScore){
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            
            .alert("Game over", isPresented: $showingGameOverAlert) {
                        Button("Restart", action: {
                            restartGame()
                        })
                    } message: {
                        Text("Your final score is \(score)")
                    }
        }.ignoresSafeArea()
        
    }
    
    func paintingTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 1
            showingScore = true
        }else{
            scoreTitle = "Wrong"
            showingGameOverAlert = true
        }
       
    }
    
    func askQuestion(){
        paintings.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame(){
        score = 0
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
