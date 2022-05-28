//
//  ItemModel.swift
//  SwiftUIExe.
//
//  Created by Zeliha Uslu on 23.05.2022.
//

import Foundation

//Immutable struct

struct  ItemModel : Identifiable, Codable{
    var id : String = UUID().uuidString
    var title : String
    var isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompleted() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}

