//
//  LoadingView.swift
//  CatProject
//
//  Created by Zeliha Uslu on 4.06.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("😸")
                .font(.system(size: 80))
            Text("Getting the cats ...")
                .foregroundColor(.gray)
            ProgressView()
           
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
