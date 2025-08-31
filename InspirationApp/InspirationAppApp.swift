//
//  InspirationAppApp.swift
//  InspirationApp
//
//  Created by Rathod, Dhruv on 8/26/25.
//

import SwiftUI

@main
struct InspirationAppApp: App {

    @State private var model = ViewModel()

    var body: some Scene {
        WindowGroup {
            Areas()
                .environment(model)  // Add this line!
        }
        .windowStyle(.plain)
        
        WindowGroup(id : "CapsuleRealityArea"){
            CapsuleRealityArea()
                .environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width:1, height:1, depth:1, in:.meters)
        
        ImmersiveSpace(id: "FullRocketRealityArea"){
            FullRocketRealityArea()
                .environment(model)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
