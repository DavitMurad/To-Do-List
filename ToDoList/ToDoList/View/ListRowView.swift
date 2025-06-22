//
//  ListRowView.swift
//  ToDoList
//
//  Created by Davit Muradyan on 22.06.25.
//

import SwiftUI

struct ListRowView: View {
    let itemModel: ItemModel
    
    var body: some View {
        HStack {
            
            Image(systemName: itemModel.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                .foregroundStyle(itemModel.isCompleted ? .green : .gray)
            Text(itemModel.title)
            Spacer()
        }
    }
}
//
//#Preview(traits: .sizeThatFitsLayout) {
//    ListRowView(itemModel: ItemModel(title: "This is the first item", isCompleted: false))
//}
//
//#Preview("This is the second title") {
//    ListRowView(itemModel: ItemModel(title: "This is the second item", isCompleted: true))
//}
