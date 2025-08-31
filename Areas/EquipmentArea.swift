//
//  EquipmentArea.swift
//  InspirationApp
//
//  Created by Rathod, Dhruv on 8/30/25.
//

import SwiftUI

struct EquipmentArea: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow)private var openWindow
    @Environment(\.dismissWindow)private var dismissWindow
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model
        
        HStack{
            VStack{
                Image("eq-capsule")
                    .resizable()
                    .frame(width: 300, height:300)
                    .padding(20)
                Toggle(model.isShowingRocketCapsule ? "Hide Rocket Capsule (Volumetric)" : "Show Rocket Capsule (Volumetric)", isOn:$model.isShowingRocketCapsule)
                    .onChange(of: model.isShowingRocketCapsule){ _, isShowing in
                        if isShowing{
                            openWindow(id: "CapsuleRealityArea")
                        }
                        else
                        {
                            dismissWindow(id: "CapsuleRealityArea")
                        }
                    }
                    .toggleStyle(.button)
                    .padding(25)
            }
            .glassBackgroundEffect()
            
            VStack{
                Image("eq-rocket")
                    .resizable()
                    .frame(width: 300, height:300)
                    .padding(20)
                Toggle(model.isShowingFullRocket ? "Hide Full Rocket (Immersed)" : "Show Full Rocket (Immersed)", isOn:$model.isShowingFullRocket)
                    .onChange(of: model.isShowingFullRocket){ _, isShowing in
                        if isShowing{
                            Task {
                                await openImmersiveSpace(id: "FullRocketRealityArea")
                            }
                        }
                        else
                        {
                            Task {
                                await dismissImmersiveSpace()
                            }
                        }
                    }
                    .toggleStyle(.button)
                    .padding(25)
            }
            .glassBackgroundEffect()
            
        }
    }
}

#Preview {
    EquipmentArea()
           .environment(ViewModel())
}
