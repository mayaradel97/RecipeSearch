//
//  RecipeDetailsRouter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import UIKit
class RecipeDetailsRouter: RecipeDetailsRouterProtocol {
    
    func createModule(with recipe: RecipeData )-> UIViewController {
        let view: RecipeDetailsViewController = .instantiate(storyboardName: "RecipeDetailsStoryboard")
        let router = RecipeDetailsRouter()
        let interactor = RecipeDetailsInteractor()
        let presenter = RecipeDetailsPresenter(view: view, interactor: interactor, router: router, recipe: recipe)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
    
    
}
