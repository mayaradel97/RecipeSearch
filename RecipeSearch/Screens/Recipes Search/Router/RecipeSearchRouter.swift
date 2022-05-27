//
//  RecipeSearchRouter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
class RecipeSearchRouter: RecipeSearchRouterProtocol {
//    private let window: UIWindow
//    init(window: UIWindow)
//    {
//        self.window = window
//    }
    func createModule()->UIViewController {
      //  let navigationController = UINavigationController()
        let view: RecipeSearchViewController = .instantiate(storyboardName: "RecipeSearchStoryboard")
        let interactor = RecipeSearchInteractor()
        let presenter = RecipeSearchPresenter(view: view, router: self, interactor: interactor)
        interactor.presenter = presenter
        view.presenter = presenter
//        navigationController.setViewControllers([view], animated: true)
//        window.rootViewController = navigationController
//        window.makeKeyAndVisible()
        return view
    }
}
