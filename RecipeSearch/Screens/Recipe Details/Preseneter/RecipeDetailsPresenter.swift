//
//  RecipeDetailsPresenter.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import Foundation
class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    //MARK:- Variables
    private weak var view: RecipeDetailsViewProtocol?
    private var interactor: RecipeDetailsInputProtocol
    private var router: RecipeDetailsRouterProtocol
    
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInputProtocol, router: RecipeDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}
extension RecipeDetailsPresenter: RecipeDetailsOutputProtocol {
    
}
