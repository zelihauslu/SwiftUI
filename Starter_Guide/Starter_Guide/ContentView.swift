//
//  ContentView.swift
//  Starter_Guide
//
//  Created by Zeliha Uslu on 31.05.2022.
//

import SwiftUI
private let imageURL: String = "https://unblast.com/wp-content/uploads/2020/05/Graphic-Design-Vector-Illustration.jpg"

extension Image{
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    var body: some View {
        
            //        // Mark: - 1. Basic
            //        AsyncImage(url: URL(string: imageURL))
            //
            //        // Mark: - 2. Scale
            //            AsyncImage(url: URL(string: imageURL), scale: 3.0)
            
            // Mark: - 3. Placeholder
            
//            AsyncImage(url: URL(string: imageURL)){ image in
//                image.imageModifier()
//            }placeholder: {
//                Image(systemName: "photo.circle.fill").iconModifier()
//
//            }
//            .padding()
        
            //Mark: - 4.Phase
        
    
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            // SUCCESS: The image successfully loaded.
//            // FAILURE: The image failed to load with an error
//            // EMPTY: No image is loaded
//            
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//                } else{
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        
//        }
//        .padding(40)
        
        //Mark: - 5. Animation
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){ phase in
            switch phase{
            case .success(let image):
                image
                    .imageModifier()
//                    .transition(.move(edge: .top))
                    .transition(.scale)
                    .transition(.opacity)
            case .empty:
                Image(systemName: "photo.fill").iconModifier()
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
