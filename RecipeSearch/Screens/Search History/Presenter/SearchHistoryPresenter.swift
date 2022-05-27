//
//  SearchHistoryPresenter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Foundation
class SearchHistoryPresenter: SearchHistoryPresenterProtocol
{
    private var view: SearchHistoryTableViewController
    private var interactor: SearchHistoryInteractor
    private var router: SearchHistoryRouter
    
    init( view: SearchHistoryTableViewController, interactor: SearchHistoryInteractor ,router: SearchHistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}
extension SearchHistoryPresenter: SearchHistoryOutputProtocol
{
    
}
