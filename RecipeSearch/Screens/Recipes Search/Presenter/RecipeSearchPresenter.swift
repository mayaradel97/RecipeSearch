//
//  RecipeSearchPresenter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation
class RecipeSearchPresenter: RecipeSearchPresenterProtocol {
  private var view: RecipeSearchViewProtocol
  private var router: RecipeSearchRouterProtocol
  private var interactor: RecipeSearchInputProtocol
    
    private var filtersArray: [Filter] = [ Filter(name: "All"),Filter(name: "Low Sugar"),Filter(name: "Keto"),Filter(name:  "Vegan")]
    var numberOfFilters: Int {
        return filtersArray.count
    }
    init (view: RecipeSearchViewProtocol, router: RecipeSearchRouterProtocol, interactor: RecipeSearchInputProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func configureFilterCell(cell: FilterCollectionViewCellProtocol,indexPath: IndexPath) {
        cell.configure(filter: filtersArray[indexPath.row])
    }
}
extension RecipeSearchPresenter: RecipeSearchOutputProtocol
{
    
}
