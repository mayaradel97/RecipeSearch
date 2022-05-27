//
//  SearchHistoryPresenter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
class SearchHistoryRouter: SearchHistoryRouterProtocol {
    func  createModule()->UIViewController {
        let view: SearchHistoryTableViewController = .instantiate(storyboardName: "SearchHistoryStoryboard")
        let interactor = SearchHistoryInteractor()
        let presenter = SearchHistoryPresenter(view: view, interactor: interactor, router: self)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}
