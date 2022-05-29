//
//  SceneDelegate.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var recipeSearchRouter: RecipeSearchRouter?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        recipeSearchRouter = RecipeSearchRouter(window: window)
        guard let recipeSearchRouter = recipeSearchRouter else {return}
        recipeSearchRouter.start()
    }
}


