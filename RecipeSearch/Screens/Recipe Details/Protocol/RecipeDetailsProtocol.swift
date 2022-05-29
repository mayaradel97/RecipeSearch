//
//  RecipeDetailsProtocol.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import UIKit
protocol RecipeDetailsViewProtocol: class {
   
}
protocol RecipeDetailsPresenterProtocol {
    var numberOfIngredients: Int {get}
    var recipeTitle: String {get}
    var imageURL: String {get}
    func configureRecipeIngredientsCell(cell: SearchHistoryTableViewCellProtocol, at indexPath: IndexPath)
    func showRecipeWebsite()
    
}
protocol RecipeDetailsRouterProtocol {
   func createModule(with recipe: RecipeData)-> UIViewController
    func showRecipeWebsite(with url: String)
}
protocol RecipeDetailsInputProtocol {
  
}
protocol RecipeDetailsOutputProtocol {
}

