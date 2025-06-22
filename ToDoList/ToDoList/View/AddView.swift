//
//  AddView.swift
//  ToDoList
//
//  Created by Davit Muradyan on 22.06.25.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText = ""
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
                    // Your action here
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
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
