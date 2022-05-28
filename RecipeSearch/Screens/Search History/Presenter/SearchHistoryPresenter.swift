//
//  SearchHistoryPresenter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation
class SearchHistoryPresenter: SearchHistoryPresenterProtocol
{
    private weak var view: SearchHistoryTableViewController?
    private var interactor: SearchHistoryInteractor
    private var router: SearchHistoryRouter
    private var searchHistoryArray: [String]
    var searchHistoryDelegate: SearchHistoryDelegate?
    var numberOfHistory: Int {
        return searchHistoryArray.count
    }
    init( view: SearchHistoryTableViewController, interactor: SearchHistoryInteractor ,router: SearchHistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.searchHistoryArray = []
    }
    func getSearchHistory(){
        interactor.getSearchHistory()
    }
    func selectedHistoryRow(at indexPath: IndexPath) {
        guard let searchHistoryDelegate = searchHistoryDelegate
        else {return}
        searchHistoryDelegate.searchFromHistory(with: searchHistoryArray[indexPath.row])
        print(searchHistoryArray[indexPath.row
        ])
    }
    func configureSearchHistoryCell(cell: SearchHistoryTableViewCellProtocol, indexPath: IndexPath)
    {
        cell.configure(searchHistoryText: searchHistoryArray[indexPath.row])
        
    }
    
}
extension SearchHistoryPresenter: SearchHistoryOutputProtocol
{
    func getSearchHistoryArray(_ searchHistoryArray: [String]?) {
        guard let historyArray = searchHistoryArray,
              let view = view
        else {
            return
        }
        self.searchHistoryArray = historyArray
        view.reloadData()
    }
    
    
}
