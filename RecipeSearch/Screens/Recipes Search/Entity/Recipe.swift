//
//  Recipe.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation
struct RecipeData: Codable {
    let label: String
    let image: String
    let source: String
    let url: String
    let healthLabels: [String]
    let ingredientLines: [String]
}
struct Recipe: Codable {
    let recipe: RecipeData
}
struct RecipeModel: Codable {
    let hits: [Recipe]
}

