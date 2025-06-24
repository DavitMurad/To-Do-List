//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Davit Muradyan on 22.06.25.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            
            .environmentObject(listViewModel)
        }
    }
}
