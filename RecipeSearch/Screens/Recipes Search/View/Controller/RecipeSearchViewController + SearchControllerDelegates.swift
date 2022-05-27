//
//  RecipeSearchViewController + SearchControllerDelegates.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
extension RecipeSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text
        else {return}
        self.searchControllerText = searchText
        presenter.getRecipes(searchText: searchText, filter: nil)
        print(searchBar.text)
        self.dismiss(animated: true, completion: nil)
    }
}
extension RecipeSearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchResultsController?.view.isHidden = false
    }
    
}
