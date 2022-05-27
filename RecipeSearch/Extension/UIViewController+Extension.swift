//
//  UIViewController+extension.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
extension UIViewController
{
  static func instantiate<T>(storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewControllerIdentifier = String(describing: T.self)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! T
        return viewController
    }
}
