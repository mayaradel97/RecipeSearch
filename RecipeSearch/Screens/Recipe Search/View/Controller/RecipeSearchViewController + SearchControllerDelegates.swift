//
//  RecipeSearchViewController + SearchControllerDelegates.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
//MARK:- UISearchBarDelegate
extension RecipeSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text
        else {return}
        self.currentSelectedFilter = 0
        self.searchControllerText = searchText
        presenter.getRecipes(searchText: searchText, filter: nil)
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK:- UISearchResultsUpdating
extension RecipeSearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        self.currentSelectedFilter = 0
        searchController.searchResultsController?.view.isHidden = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.visibilityOfUIElement()
    }
    
}
