//
//  RecipeSearchViewController + RecipesTableView.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit

//MARK:- UITableViewDataSource
extension RecipeSearchViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRecipes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeCell = tableView.dequeueReusableCell(withIdentifier: recipeTableViewCell, for: indexPath) as? RecipeTableViewCell
        else {
            return UITableViewCell()
        }
        presenter.configureRecipeCell(cell: recipeCell, indexPath: indexPath)
        return recipeCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
}
//MARK:- UITableViewDelegate
extension RecipeSearchViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedRecipeRow(at: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
    
}
