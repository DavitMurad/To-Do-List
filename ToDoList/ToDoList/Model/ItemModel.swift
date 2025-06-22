//
//  ItemModel.swift
//  ToDoList
//
//  Created by Davit Muradyan on 22.06.25.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
