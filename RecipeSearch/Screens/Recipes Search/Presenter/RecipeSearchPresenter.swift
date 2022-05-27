//
//  RecipeSearchPresenter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation

class RecipeSearchPresenter: RecipeSearchPresenterProtocol {
    //MARK:- Variables
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
        self.addObserverToSelectedSearchHistory()
    }
    //MARK:- get recipes
    func getRecipes(searchText: String, filter: String?) {
        let searchTextWithoutSpaces = searchText.removeEmptySpace()
        if searchTextValidation(searchTextWithoutSpaces)
        {
            //add to history
            interactor.saveSearchText(searchTextWithoutSpaces)
            //get recipes
            guard let view = self.view else {return}
            view.showLoadingIndicator()
            interactor.getRecipes(searchText: searchTextWithoutSpaces, filter: filter)
        }
        
    }
    //MARK:- Search text validation
    func searchTextValidation(_ searchText: String)-> Bool {
        if searchText.isEmpty {
            router.showAlert(with: "empty spaces are not allowed")
            return false
        }
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9 ].*", options: [])
            let englishRegex =  regex.firstMatch(in: searchText, options: [], range: NSMakeRange(0, searchText.count))
            if englishRegex != nil {
                router.showAlert(with : "only english letters and spaces are allowed")
                return false
            }
            else {
                return true
            }
        }
        catch {
            print("ERROR")
            return false
            
        }
    }
    //MARK:- search from history
    func addObserverToSelectedSearchHistory() {
        NotificationCenter.default.addObserver(self, selector: #selector(searchFromHistory(_:)), name: NSNotification.Name(rawValue: Constant.searchHistory.rawValue), object: nil)
    }
    @objc func searchFromHistory(_ notifications: Notification)
    {
        if let data = notifications.userInfo
        {
            guard let selectedSearchHistory = data[Constant.selectedSearchHistory.rawValue] as? String
            else {return}
            self.getRecipes(searchText: selectedSearchHistory, filter: nil)
            
        }
    }
    
    //MARK:- cells configuration
    func configureFilterCell(cell: FilterCollectionViewCellProtocol,indexPath: IndexPath) {
        cell.configure(filter: filtersArray[indexPath.row])
    }
    func configureRecipeCell(cell: RecipeTableViewCellProtocol, indexPath: IndexPath) {
        cell.configure(recipe: recipes[indexPath.row].recipe)
    }
    //MARK:- selected filter 
    func getFilterName(at indexPath: IndexPath)-> String?
    {
        guard let filterName = filtersArray[indexPath.row].healthFilter
        else {return nil}
        return filterName
    }
}
//MARK:- RecipeSearchOutputProtocol
extension RecipeSearchPresenter: RecipeSearchOutputProtocol
{
    func getFetchedRecipes(recipes: [Recipe]) {
        self.recipes = recipes
        print(recipes.count)
        guard let view = self.view else {return}
        view.hideLoadingIndicator()
        view.reloadData()
    }
}
