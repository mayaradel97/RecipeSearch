//
//  Filter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation
//struct Filter {
//    let name: String
//}
enum Filter: String
{
    case ALL
    case LowSugar = "Low Sugar"
    case Keto
    case Vegan
    
    var healthFilter: String?
    {
        switch self {
        case .ALL:
            return nil
        case .LowSugar:
            return "low-sugar"
        case .Keto:
           return "keto-friendly"
        case .Vegan:
        return "vegan"
        }
    }
}
