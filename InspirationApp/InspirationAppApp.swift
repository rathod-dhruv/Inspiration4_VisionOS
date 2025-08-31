//
//  InspirationAppApp.swift
//  InspirationApp
//
//  Created by Rathod, Dhruv on 8/26/25.
//

import SwiftUI

@main
struct InspirationAppApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            Areas()
        }
        .windowStyle(.plain)
        
    }
}
