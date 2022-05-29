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
    private var router: RecipeDetailsRouterProtocol
    private var recipeDetails: RecipeData
    var numberOfIngredients: Int {
        return recipeDetails.ingredientLines.count
    }
    
    //MARK:- init
    init(view: RecipeDetailsViewProtocol, router: RecipeDetailsRouterProtocol,recipe: RecipeData) {
        self.view = view
        self.router = router
        self.recipeDetails = recipe
    }
    //MARK:- cell configuration
    func configureRecipeIngredientsCell(cell: SearchHistoryTableViewCellProtocol, at indexPath: IndexPath) {
        let recipeIngredient = recipeDetails.ingredientLines[indexPath.row]
        cell.configure(searchHistoryText: recipeIngredient)
    }
    //MARK:- Recipe data
    func getRecipeData() {
        guard let view = view else {return}
        view.getRecipe(title: recipeDetails.label, imageURL: recipeDetails.image)
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

