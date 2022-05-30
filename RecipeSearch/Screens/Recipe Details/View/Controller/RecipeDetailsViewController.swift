//
//  RecipeDetailsViewController.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/28/22.
//

import UIKit
import SDWebImage
class RecipeDetailsViewController: UIViewController {
    
    //MARK: - variables
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeIngredientsTableView: UITableView!
    var presenter: RecipeDetailsPresenterProtocol!
    var recipeIngredientsTableViewCell: String!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUIElements()
        self.cellRegisteration()
        self.presenter.getRecipeData()
    }
    //MARK: - cell registeration
    func cellRegisteration() {
        recipeIngredientsTableViewCell = Constant.SearchHistoryTableViewCell.rawValue
        self.recipeIngredientsTableView.register(UINib(nibName: recipeIngredientsTableViewCell, bundle: nil), forCellReuseIdentifier: recipeIngredientsTableViewCell)
    }
    //MARK: - UI configuration
    func configureUIElements() {
        title = "Recipe Details"
        recipeIngredientsTableView.tableFooterView = UIView()
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.6889460357, blue: 0, alpha: 1)
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItem = shareButton
    }
    
    
    //MARK: - share button
    @objc func shareButtonTapped() {
        self.presenter.shareRecipeURL()
    }
    
    
    //MARK: - recipeWebsite button
    @IBAction func recipeWebsiteButtonTapped(_ sender: UIButton) {
        self.presenter.showRecipeWebsite()
    }
}
//MARK: - RecipeDetailsViewProtocol
extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
    
    func getRecipe(title: String, imageURL: String) {
        self.recipeTitleLabel.text = title
        self.recipeImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.recipeImageView.sd_setImage(with: URL(string: imageURL), completed: nil)
    }
    
    
}
