//
//  NewsDemoSwiftUIApp.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import SwiftUI

@main
struct NewsDemoSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
