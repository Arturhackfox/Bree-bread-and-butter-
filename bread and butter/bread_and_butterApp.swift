//
//  bread_and_butterApp.swift
//  bread and butter
//
//  Created by Arthur Sh on 13.12.2022.
//

import SwiftUI

@main
struct bread_and_butterApp: App {
    @StateObject var dataControler = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataControler.container.viewContext)
        }
    }
}
