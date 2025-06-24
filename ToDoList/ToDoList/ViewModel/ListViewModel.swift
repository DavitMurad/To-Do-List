//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Davit Muradyan on 23.06.25.
//

import Foundation
import SwiftUI


class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {                                                                                                // modifications use didSet, instead of copy pasting to add, delete, change...
            saveItems()
        }
    }
    let itemKey = "itemKey"
    
    init() {
       getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems

    }
    
    func deleteListItem(_ indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(_ from: IndexSet, _ to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false, isHighlited: false)
        items.append(newItem)
    }
    
    func updateCompletedState(for index: Int) {
        items[index] = items[index].updateCompletion()
    }
    func updateHighlitedState(for index: Int) {
        items[index] = items[index].updateHighlighted()
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
