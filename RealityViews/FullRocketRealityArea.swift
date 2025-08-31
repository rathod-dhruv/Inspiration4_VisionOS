//
//  FullRocketRealityArea.swift
//  InspirationApp
//
//  Created by Rathod, Dhruv on 8/31/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FullRocketRealityArea: View {
    @State private var audioController:AudioPlaybackController?
    var body: some View {
        RealityView{ content in
            guard let entity = try? await Entity(named:"Immersive", in:realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            
            let ambientAudioEntity = entity.findEntity(named:"AmbientAudio")
            
            guard let resource = try? await AudioFileResource(named:"/Root/Space_mp3", from:"Immersive.usda", in:realityKitContentBundle) else {
                fatalError("Unable to find space.mp3 file")
            }
            
            audioController = ambientAudioEntity?.prepareAudio(resource)
            audioController?.play()
            
            content.add(entity)
        }
        .onDisappear(perform: {
            audioController?.stop()
        })
    }
}

#Preview {
    FullRocketRealityArea()
        .environment(ViewModel())
}
