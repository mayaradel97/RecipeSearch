//
//  RecipeSearchInteractor.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation
class RecipeSearchInteractor: RecipeSearchInputProtocol {
    //MARK:- Variables
    var presenter: RecipeSearchOutputProtocol!
    private var worker: RecipeSearchWorker
    private var userDefault: UserDefaults
    
    init() {
        worker = RecipeSearchWorker()
        userDefault = UserDefaults.standard
    }
    //MARK:- get recipes
    func getRecipes(searchText: String, filter: String?)  {
        worker.getRescipes(searchText: searchText, filter: filter) {[weak self] (fetchedRecipes) in
            guard let recipes = fetchedRecipes?.hits ,
                  let self = self
            else {
                print("nil")
                return}
            self.presenter.getFetchedRecipes(recipes: recipes)
            
        }
    }
    //MARK:- save search
    func saveSearchText(_ searchText: String) {
        
        var historyArray = [String]()
        historyArray.append(searchText)
        
        if  var SavedHistoryArray = userDefault.stringArray(forKey: Constant.historyArray.rawValue) {
            if SavedHistoryArray.count == 10 {
                SavedHistoryArray.removeLast()
            }
            //remove repeated element
            if SavedHistoryArray.contains(searchText){
                SavedHistoryArray =  SavedHistoryArray.filter{$0 != searchText}
            }
            historyArray.append(contentsOf: SavedHistoryArray)
        }
        print(historyArray)
        userDefault.setValue(historyArray, forKey: Constant.historyArray.rawValue)
    }
    
}

