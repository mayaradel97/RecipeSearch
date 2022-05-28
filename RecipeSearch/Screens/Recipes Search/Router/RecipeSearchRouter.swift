//
//  RecipeSearchRouter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
class RecipeSearchRouter: RecipeSearchRouterProtocol {
    
    
    private let window: UIWindow
    private var view: UIViewController!
   private var navigationController: UINavigationController
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }
    func showRecipeDetails()
    {
        self.navigationController.pushViewController(RecipeDetailsRouter().createModule(), animated: true)
    }
    func start() {
        self.createModule()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    func createModule() {
        let view: RecipeSearchViewController = .instantiate(storyboardName: "RecipeSearchStoryboard")
        let interactor = RecipeSearchInteractor()
        let presenter = RecipeSearchPresenter(view: view, router: self, interactor: interactor)
        interactor.presenter = presenter
        view.presenter = presenter
        let searchHistoryRouter = SearchHistoryRouter().createModule(delegate: presenter)
        view.searchController = UISearchController(searchResultsController: searchHistoryRouter)
        navigationController.setViewControllers([view], animated: true)
        self.view = view
        
    }
    func showAlert(with message: String )  {
        self.view.showAlert(with: message)
    }
}
