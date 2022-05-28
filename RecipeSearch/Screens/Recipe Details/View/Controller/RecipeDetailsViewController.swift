//
//  RecipeDetailsViewController.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    var presenter: RecipeDetailsPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUIElements()
    }
    func configureUIElements() {
        title = "Recipe Details"
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.6889460357, blue: 0, alpha: 1)
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItem = shareButton
    }
    @objc func shareButtonTapped() {
        print("pressed")
    }
    
}
extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
    
}
