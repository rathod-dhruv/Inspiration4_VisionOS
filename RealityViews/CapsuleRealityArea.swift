//
//  CapsuleRealityArea.swift
//  InspirationApp
//
//  Created by Rathod, Dhruv on 8/31/25.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct CapsuleRealityArea: View {
    var body: some View {
        RealityView{ content in
            guard let entity = try? await Entity(named:"Scene", in:realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            content.add(entity)
        }
    }
}

#Preview {
    CapsuleRealityArea()
        .environment(ViewModel())
}
