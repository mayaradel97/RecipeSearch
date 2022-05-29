//
//  RecipeDetailsViewController + RecipeIngredientsTableView.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import UIKit
extension RecipeDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfIngredients
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: recipeIngredientsTableViewCell, for: indexPath) as? SearchHistoryTableViewCell
        else {
            return UITableViewCell()
        }
        self.presenter.configureRecipeIngredientsCell(cell: cell, at: indexPath)
        return cell
    }
    
    
}
