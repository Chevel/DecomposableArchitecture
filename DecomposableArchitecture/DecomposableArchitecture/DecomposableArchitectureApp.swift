//
//  DecomposableArchitectureApp.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import SwiftUI
import SwiftData
import ComposableArchitecture

@main
struct DecomposableArchitectureApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView(store: Store(initialState: RootViewFeature.State(title: "asd")) { RootViewFeature() })
        }
        .modelContainer(sharedModelContainer)
    }
}
