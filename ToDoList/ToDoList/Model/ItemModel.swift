//
//  ItemModel.swift
//  ToDoList
//
//  Created by Davit Muradyan on 22.06.25.
//

import Foundation


struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    var isHighlited: Bool
    
    init(id: String = UUID().uuidString,title: String, isCompleted: Bool, isHighlited: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.isHighlited = isHighlited
    }
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, isHighlited: isHighlited)
    }
    
    func updateHighlighted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: isCompleted, isHighlited: !isHighlited)

    }
    
    func saveItem() {
//        UserDefaults.standard.set
    }
}
