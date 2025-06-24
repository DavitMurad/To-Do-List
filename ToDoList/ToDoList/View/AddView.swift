//
//  AddView.swift
//  ToDoList
//
//  Created by Davit Muradyan on 22.06.25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    @State var isAlertPresent = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("What's on the agenda?", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.secondary.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                
                
                Button(action: {
                    saveButtonPressed()
                }) {
                    Text("SAVE")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $isAlertPresent) {
            getAlert()
        }
    }
    func saveButtonPressed() {
        if textIsValid() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        } else {
            isAlertPresent.toggle()
        }

    }
    
    func textIsValid() -> Bool {
        return textFieldText.count > 3 ? true : false
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("Your task should have at least 3 characters"))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
