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
}
protocol RecipeDetailsRouterProtocol {
   func createModule(with recipe: RecipeData)-> UIViewController
}
protocol RecipeDetailsInputProtocol {
  
}
protocol RecipeDetailsOutputProtocol {
}

