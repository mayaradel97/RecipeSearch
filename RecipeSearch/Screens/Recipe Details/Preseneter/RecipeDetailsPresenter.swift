//
//  RecipeDetailsPresenter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import Foundation
class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    //MARK:- Variables
    private weak var view: RecipeDetailsViewProtocol?
    private var interactor: RecipeDetailsInputProtocol
    private var router: RecipeDetailsRouterProtocol
    private var recipeDetails: RecipeData
    var numberOfIngredients: Int {
        return recipeDetails.ingredientLines.count
    }
    var recipeTitle: String {
        return recipeDetails.label
    }
    var imageURL: String {
        return recipeDetails.image
    }
    //MARK:- init
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInputProtocol, router: RecipeDetailsRouterProtocol,recipe: RecipeData) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.recipeDetails = recipe
    }
    //MARK:- cell configuration
    func configureRecipeIngredientsCell(cell: SearchHistoryTableViewCellProtocol, at indexPath: IndexPath) {
        let recipeIngredient = recipeDetails.ingredientLines[indexPath.row]
        cell.configure(searchHistoryText: recipeIngredient)
    }
    //MARK:- open website
    func showRecipeWebsite() {
        self.router.showRecipeWebsite(with: recipeDetails.url)
    }
    //MARK:- share website
    func shareRecipeURL() {
        self.router.shareRecipeURL(with: recipeDetails.url)
    }
    
}
extension RecipeDetailsPresenter: RecipeDetailsOutputProtocol {
    
}
