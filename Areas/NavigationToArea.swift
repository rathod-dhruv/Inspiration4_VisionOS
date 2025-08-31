//
//  NavigationToArea.swift
//  InspirationApp
//
//  Created by Rathod, Dhruv on 8/26/25.
//

import SwiftUI

struct NavigationToArea: View {
    var body: some View {
        VStack{
            Text("Welcome to The Inspiration 4 Mission By SpaceX")
                .monospaced()
                .font(.system(size:40, weight:.bold))
                .padding(.top, 250)
            
            HStack(spacing:25)
            {
                ForEach(Area.allCases)
                {
                    area in
                    NavigationLink{
                        Text(area.title)
                            .monospaced()
                            .font(.system(size:40, weight : .bold))
                        
                        if area == Area.astronauts{
                            CrewArea()
                        }
                        else if area == Area.equipment
                        {
                            
                        }
                        
                    } label: {
                        Label(area.name, systemImage: "chevron.right")
                            .monospaced()
                            .font(.title)
                    }
                    .controlSize(.extraLarge)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background()
        {
            Image("Inspiration4")
                .resizable()
                .scaledToFill()
                .clipped()
                
        }
        
    }
    
}

#Preview {
    NavigationToArea()
}
