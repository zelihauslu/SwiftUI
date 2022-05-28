//
//  SwiftUIExe_App.swift
//  SwiftUIExe.
//
//  Created by Zeliha Uslu on 23.05.2022.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - models view for View
 
 */

@main
struct SwiftUIExe_App: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}



