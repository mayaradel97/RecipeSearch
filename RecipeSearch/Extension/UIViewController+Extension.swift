//
//  UIViewController+extension.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
extension UIViewController
{
    func showAlert(with message: String)
    {
        let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
  static func instantiate<T>(storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewControllerIdentifier = String(describing: T.self)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! T
        return viewController
    }
}
