//
//  ListView.swift
//  ToDoList
//
//  Created by Davit Muradyan on 22.06.25.
//

import SwiftUI

struct ListView: View {
    @State var items = [
        ItemModel(title: "First thing to do", isCompleted: false),
        ItemModel(title: "Second thing to do", isCompleted: true),
        ItemModel(title: "Third thing to do", isCompleted: true),
    ]
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(itemModel: item)

            }
        }
        .navigationTitle("To Do List 📋")
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
                NavigationLink("Edit", destination: Text("Destination"))
                    
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
                    
            }
            
        }
    }
        
}

#Preview {
    NavigationView {
        ListView()
    }
}
