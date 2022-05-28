//
//  RecipeSearchProtocol.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation

protocol RecipeSearchViewProtocol: class {
    var searchHistoryText: String {get set}
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func failedData()
    func reloadData() 
}
protocol RecipesProtocol {
    func getRecipes(searchText: String, filter: String?)
}
protocol RecipeSearchPresenterProtocol: RecipesProtocol {
    var numberOfFilters: Int { get }
    var numberOfRecipes: Int { get }
    func configureFilterCell(cell: FilterCollectionViewCellProtocol, indexPath: IndexPath)
    func configureRecipeCell(cell: RecipeTableViewCellProtocol, indexPath: IndexPath)
    func getFilterName(at indexPath: IndexPath)-> String?
    func selectedRecipeRow(at indexPath: IndexPath)
}
protocol RecipeSearchRouterProtocol {
    func start()
    func createModule()
    func showAlert(with message: String )
    func showRecipeDetails(of recipe: RecipeData)
}
protocol RecipeSearchInputProtocol: RecipesProtocol {
    func saveSearchText(_ searchText: String)
}
protocol RecipeSearchOutputProtocol {
    func getFetchedRecipes(recipes: [Recipe])
    func fetchedRecipesFailed()
}
protocol FilterCollectionViewCellProtocol {
    func configure(filter: Filter)
}
protocol RecipeTableViewCellProtocol {
    func configure(recipe: RecipeData)
}
