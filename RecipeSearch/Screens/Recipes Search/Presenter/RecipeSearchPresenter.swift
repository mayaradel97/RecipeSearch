//
//  RecipeSearchPresenter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation

class RecipeSearchPresenter: RecipeSearchPresenterProtocol {
    private weak var view: RecipeSearchViewProtocol?
  private var router: RecipeSearchRouterProtocol
  private var interactor: RecipeSearchInputProtocol
  private var recipes: [Recipe]
    private var filtersArray: [Filter] = [.ALL,.LowSugar,.Keto,.Vegan]
    var numberOfFilters: Int {
        return filtersArray.count
    }
    var numberOfRecipes: Int {
        return recipes.count
    }
    init (view: RecipeSearchViewProtocol, router: RecipeSearchRouterProtocol, interactor: RecipeSearchInputProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.recipes = []
    }
    func getRecipes(searchText: String, filter: String?) {
        print("filer")
        interactor.getRecipes(searchText: searchText, filter: filter)
    }
    
    func configureFilterCell(cell: FilterCollectionViewCellProtocol,indexPath: IndexPath) {
        cell.configure(filter: filtersArray[indexPath.row])
    }
    func configureRecipeCell(cell: RecipeTableViewCellProtocol, indexPath: IndexPath) {
        cell.configure(recipe: recipes[indexPath.row].recipe)
    }
    func getFilterName(at indexPath: IndexPath)-> String?
    {
        guard let filterName = filtersArray[indexPath.row].healthFilter
        else {return nil}
        return filterName
    }
}
extension RecipeSearchPresenter: RecipeSearchOutputProtocol
{
    func getFetchedRecipes(recipes: [Recipe]) {
        self.recipes = recipes
        print(recipes.count)
        guard let view = self.view else {return}
        view.reloadData()
    }
}
