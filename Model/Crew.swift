//
//  Crew.swift
//  InspirationApp
//
//  Created by Rathod, Dhruv on 8/26/25.
//

import Foundation


enum Crew : String, Identifiable, CaseIterable, Equatable {
    
    case jared, haley, chris, sian
    var id : Self{self}
    
    var name: String { rawValue.lowercased()}
    
    var fullName : String {
        switch self {
        case .jared:
             "Jared Isaacman"
        case .haley:
             "Haley A"
        case .chris:
             "Chris S"
        case .sian:
             "Dr. Sianm P"
        }
    }
    
    
    var about : String{
        switch self{
        case .jared:
            "Jared I --- CEO"
        case .haley:
            "Haley A - 10 years old"
        case .chris:
            "Chris S --- Khbr nai"
        case .sian:
            "Dr. Sianm P - Kaik to chhe"
        }
    }
}
