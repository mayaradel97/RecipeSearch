//
//  RecipeDetailsProtocol.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import UIKit
protocol RecipeDetailsViewProtocol: class {
    func getRecipe(title: String, imageURL: String)
}
protocol RecipeDetailsPresenterProtocol {
    var numberOfIngredients: Int {get}
    func getRecipeData()
    func configureRecipeIngredientsCell(cell: SearchHistoryTableViewCellProtocol, at indexPath: IndexPath)
    func showRecipeWebsite()
    func shareRecipeURL()
    
}
protocol RecipeDetailsRouterProtocol {
    func createModule(with recipe: RecipeData)-> UIViewController
    func showRecipeWebsite(with url: String)
    func shareRecipeURL(with url: String)
}

