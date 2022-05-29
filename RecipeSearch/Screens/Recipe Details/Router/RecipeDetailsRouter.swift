//
//  RecipeDetailsRouter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import UIKit
import SafariServices
class RecipeDetailsRouter: RecipeDetailsRouterProtocol {
    
    private var view: RecipeDetailsViewController
    init() {
        view = .instantiate(storyboardName: "RecipeDetailsStoryboard")
    }
    func createModule(with recipe: RecipeData ) -> UIViewController {
        
        let interactor = RecipeDetailsInteractor()
        let presenter = RecipeDetailsPresenter(view: view, interactor: interactor, router: self, recipe: recipe)
        view.presenter = presenter
        interactor.presenter = presenter
      //  self.view = view
        
        return view
    }
    func showRecipeWebsite(with url: String) {
        guard let url = URL(string: url)
        else {return}
        let safariViewController = SFSafariViewController(url: url)
        self.view.present(safariViewController, animated: true, completion: nil)
        
    }
}
