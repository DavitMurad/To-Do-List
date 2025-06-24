//
//  ListView.swift
//  ToDoList
//
//  Created by Davit Muradyan on 22.06.25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
  
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
               NoItemView()
            } else {
                List {
                    ForEach(Array(listViewModel.items.enumerated()), id: \.element.id) { index, item in
                        ListRowView(itemModel: item)
                            .contextMenu(menuItems: {
                                Button(item.isCompleted ? "Unset as completed ❌" : "Set as completed ✅") {
                                    listViewModel.updateCompletedState(for: index)
                                }
                                Button(item.isHighlited ? "Unhighlight 🔴" : "Highlight 🧷") {
                                    listViewModel.updateHighlitedState(for: index)
                                }
                            })
                            .onTapGesture(perform: {
                                withAnimation {
                                    listViewModel.updateCompletedState(for: index)

                                }
                            })
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                
                                Button("Highlight") {
                                    listViewModel.updateHighlitedState(for: index)
                                }
                                .tint(.green)
                            }
                    }
                    .onMove(perform: listViewModel.moveItem)
                    .onDelete(perform: listViewModel.deleteListItem)
                  
                }
            }
        }
      
        .navigationTitle("To Do List 📋")
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
//                NavigationLink("Edit", destination: Text("Destination"))
                EditButton()
                    
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
                    
            }
            
        }
    }
        
}

#Preview {
    @StateObject var listViewModel: ListViewModel = ListViewModel()

    NavigationView {
        ListView()
    }
    .environmentObject(listViewModel)
}
