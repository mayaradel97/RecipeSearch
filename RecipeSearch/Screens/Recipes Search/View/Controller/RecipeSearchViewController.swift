//
//  ViewController.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
class RecipeSearchViewController: UIViewController {
    
    //MARK:- Variables
    @IBOutlet weak var noSearchView: UIStackView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var recipesTableView: UITableView!
    var presenter: RecipeSearchPresenterProtocol!
    var searchController: UISearchController!
    var filterCollectionViewCell: String!
    var recipeTableViewCell: String!
    var searchControllerText: String!
    var currentSelectedFilter = 0 {
        didSet {
            self.filterCollectionView.reloadData()
        }
    }
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellsRegisteration()
        self.searchControllerConfiguration()
        self.visibilityOfUIElement()
    }
    
    //MARK:- UIElement visibility
    func visibilityOfUIElement()
    {
        self.loadingIndicator.stopAnimating()
        self.noSearchView.isHidden = false
        self.filterCollectionView.isHidden = true
        self.recipesTableView.isHidden = true
    }
    
    
    //MARK:- cells registeration
    func cellsRegisteration() {
        
        filterCollectionViewCell = String(describing: FilterCollectionViewCell.self)
        recipeTableViewCell = String(describing: RecipeTableViewCell.self)
        
        filterCollectionView.register(UINib(nibName: filterCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: filterCollectionViewCell)
        recipesTableView.register(UINib(nibName: recipeTableViewCell, bundle: nil), forCellReuseIdentifier: recipeTableViewCell)
    }
    
    
    //MARK:- search controller
    func searchControllerConfiguration() {
        title = "Recipes Search"
        searchController.searchBar.placeholder = "Search..."
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        //change cancel button color
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = #colorLiteral(red: 0, green: 0.6889460357, blue: 0, alpha: 1)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
    }
}
//MARK:- RecipeSearchViewProtocol
extension RecipeSearchViewController: RecipeSearchViewProtocol
{
    var searchHistoryText: String {
        
        get {
            return searchControllerText
        }
        set {
            searchControllerText = newValue
        }
    }
    
    func showLoadingIndicator() {
        self.loadingIndicator.startAnimating()
        self.noSearchView.isHidden = true
    }
    
    func hideLoadingIndicator() {
        self.loadingIndicator.stopAnimating()
        self.filterCollectionView.isHidden = false
        self.recipesTableView.isHidden = false
    }
    func failedData() {
        self.loadingIndicator.stopAnimating()
        self.noSearchView.isHidden = false
        self.filterCollectionView.isHidden = true
        self.recipesTableView.isHidden = true
        self.searchController.searchBar.text = nil
    }
    func reloadData() {
        self.recipesTableView.reloadData()
    }
}


//MARK:- search from history
extension RecipeSearchViewController: SearchHistoryDelegate
{
    func searchFromHistory(with selectedSearchHistory: String) {
        self.searchHistoryText = selectedSearchHistory
        self.searchController.searchBar.text = selectedSearchHistory
        self.presenter.getRecipes(searchText: selectedSearchHistory, filter: nil)
    }
    
    
}
