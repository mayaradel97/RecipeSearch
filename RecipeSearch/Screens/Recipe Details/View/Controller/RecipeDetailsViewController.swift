//
//  RecipeDetailsViewController.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import UIKit
import SDWebImage
class RecipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var recipeIngredientsTableView: UITableView!
    var presenter: RecipeDetailsPresenterProtocol!
     var recipeIngredientsTableViewCell: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUIElements()
        self.cellRegisteration()
        self.setRecipeDetailsToUIElement()
        print(presenter.numberOfIngredients)
    }
    func cellRegisteration() {
        recipeIngredientsTableViewCell = String(describing: SearchHistoryTableViewCell.self)
        self.recipeIngredientsTableView.register(UINib(nibName: recipeIngredientsTableViewCell, bundle: nil), forCellReuseIdentifier: recipeIngredientsTableViewCell)
    }
    func configureUIElements() {
        title = "Recipe Details"
        recipeIngredientsTableView.tableFooterView = UIView()
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.6889460357, blue: 0, alpha: 1)
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItem = shareButton
    }
    @objc func shareButtonTapped() {
        print("pressed")
    }
    
    func setRecipeDetailsToUIElement() {
        self.recipeTitleLabel.text = presenter.recipeTitle
        self.recipeImageView.sd_setImage(with: URL(string: presenter.imageURL), completed: nil)
    }
    @IBAction func recipeWebsiteButtonTapped(_ sender: UIButton) {
        self.presenter.showRecipeWebsite()
    }
}
extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
    
}
