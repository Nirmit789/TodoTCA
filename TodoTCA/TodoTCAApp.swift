//
//  TodoTCAApp.swift
//  TodoTCA
//
//  Created by Nirmit Patel on 07/07/23.
//

import ComposableArchitecture
import SwiftUI

@main
struct TodoTCAApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
              store: Store(initialState: Todos.State()) {
                Todos()._printChanges()
              }
            )
        }
    }
}
