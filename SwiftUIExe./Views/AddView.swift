//
//  AddView.swift
//  SwiftUIExe.
//
//  Created by Zeliha Uslu on 23.05.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel 
    @State var textField : String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type here!", text: $textField)
                    .padding()
                    .frame(height: 55, alignment: .topLeading)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(textAppropriate() ? Color.accentColor : Color.accentColor.opacity(0.5))
                        .cornerRadius(10)
                        .overlay(Text("Save")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white))
                })
            }.padding(14)
           
        }.navigationTitle("Create new task✍️")
            .alert(isPresented: $showAlert, content: getAlert)
        }
    
    func saveButtonPressed(){
        if textAppropriate() == true{
            listViewModel.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textAppropriate() -> Bool{
        if textField.count  < 3{
            alertTitle = "New todo item must be at least 3 characters long🙎🤏"
            showAlert.toggle()
            return false
        }
            return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
    }


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                AddView()
            }.preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            NavigationView{
                AddView()
            }.environmentObject(ListViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
