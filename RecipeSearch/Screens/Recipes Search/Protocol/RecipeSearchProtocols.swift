//
//  RecipeSearchProtocol.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
protocol RecipeSearchViewProtocol {
    
}

protocol RecipeSearchPresenterProtocol {
    var numberOfFilters: Int { get }
    func configureFilterCell(cell: FilterCollectionViewCellProtocol, indexPath: IndexPath)
    
}
protocol RecipeSearchRouterProtocol {
    func  createModule()-> UIViewController
}
protocol RecipeSearchInputProtocol {
    
}
protocol RecipeSearchOutputProtocol {
    
}
protocol FilterCollectionViewCellProtocol {
    func configure(filter: Filter)
}
