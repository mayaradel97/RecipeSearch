//
//  RecipeSearchInteractor.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation
class RecipeSearchInteractor: RecipeSearchInputProtocol {
    var presenter: RecipeSearchOutputProtocol!
    var worker: RecipeSearchWorker
    
    init() {
        worker = RecipeSearchWorker()
    }
    func getRecipes(searchText: String, filter: String?)  {
        worker.getRescipes(searchText: searchText, filter: filter) {[weak self] (fetchedRecipes) in
            guard let recipes = fetchedRecipes?.hits ,
                let self = self
            else {
                print("nil")
                return}
            self.presenter.getFetchedRecipes(recipes: recipes)
//            print(recipes.count)
            
        }
    }
}

