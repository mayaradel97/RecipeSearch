//
//  SearchHistoryProtocols.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
protocol SearchHistoryViewProtocol: class {
    func reloadData()
}
protocol SearchHistoryProtocol {
    func getSearchHistory()
}
protocol SearchHistoryPresenterProtocol: SearchHistoryProtocol {
    var numberOfHistory: Int {get}
    func getSearchHistory()
    func configureSearchHistoryCell(cell: SearchHistoryTableViewCellProtocol, indexPath: IndexPath)
}
protocol SearchHistoryRouterProtocol {
    func  createModule()-> UIViewController
}
protocol SearchHistoryInputProtocol: SearchHistoryProtocol {
  
}
protocol SearchHistoryOutputProtocol {
    func getSearchHistoryArray(_ searchHistoryArray: [String]?)
}
protocol SearchHistoryTableViewCellProtocol
{
    func configure(searchHistoryText: String)
}

