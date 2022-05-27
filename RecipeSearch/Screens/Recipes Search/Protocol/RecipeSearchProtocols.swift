//
//  RecipeSearchProtocol.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
protocol Recipes {
    func getRecipes(searchText: String, filter: String?)
}
protocol RecipeSearchViewProtocol: class {
    func reloadData() 
}

protocol RecipeSearchPresenterProtocol: Recipes {
    var numberOfFilters: Int { get }
    var numberOfRecipes: Int { get }
    func configureFilterCell(cell: FilterCollectionViewCellProtocol, indexPath: IndexPath)
    func configureRecipeCell(cell: RecipeTableViewCellProtocol, indexPath: IndexPath)
    func getFilterName(at indexPath: IndexPath)-> String?
    
}
protocol RecipeSearchRouterProtocol {
    func  createModule()-> UIViewController
}
protocol RecipeSearchInputProtocol: Recipes {
//    func getRecipes(searchText: String, filter: String?) 
}
protocol RecipeSearchOutputProtocol {
    func getFetchedRecipes(recipes: [Recipe])
}
protocol FilterCollectionViewCellProtocol {
    func configure(filter: Filter)
}
protocol RecipeTableViewCellProtocol {
    func configure(recipe: RecipeData)
}
