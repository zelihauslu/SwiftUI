//
//  ListView.swift
//  SwiftUIExe.
//
//  Created by Zeliha Uslu on 23.05.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                noItemsView()
            }else{
                List{
                    ForEach(listViewModel.items){ item in
                       ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)

                }
            }
        }.listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination:
                                    AddView().navigationTitle("Create new task✍️"))
            )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}




