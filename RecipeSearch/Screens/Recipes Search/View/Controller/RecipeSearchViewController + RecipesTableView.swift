//
//  RecipeSearchViewController + RecipesTableView.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
extension RecipeSearchViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeCell = tableView.dequeueReusableCell(withIdentifier: recipeTableViewCell, for: indexPath) as? RecipeTableViewCell
        else {
            return UITableViewCell()
        }
        return recipeCell
    }
    
    
}
