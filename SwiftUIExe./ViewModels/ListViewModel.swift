//
//  ListViewModel.swift
//  SwiftUIExe.
//
//  Created by Zeliha Uslu on 25.05.2022.
//

import Foundation

/*
 
 CRUD Functions
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject{
    
    @Published var items : [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemsKeys : String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "This is first title!", isCompleted: true),
//            ItemModel(title: "This is second!", isCompleted: true),
//            ItemModel(title: "Third!", isCompleted: false)
//
//        ]
//            items.append(contentsOf: newItems)
        guard
                let data = UserDefaults.standard.data(forKey: itemsKeys),
                let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{return}
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
}
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        
//        if let index = items.firstIndex{ (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }{
//            //run this code
//        }
        
//        if let index = items.firstIndex(where: { $0.id == item.id}){
//            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompleted()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: "items_list")
        }
    }
}


