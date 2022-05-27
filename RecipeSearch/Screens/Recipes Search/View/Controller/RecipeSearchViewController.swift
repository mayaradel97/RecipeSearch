//
//  ViewController.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
class RecipeSearchViewController: UIViewController {
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var recipesTableView: UITableView!
    
    var presenter: RecipeSearchPresenterProtocol!
    var searchController: UISearchController!
    var filterCollectionViewCell: String!
    var recipeTableViewCell: String!
    var searchControllerText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellsRegisteration()
        self.searchControllerConfiguration()
    }
    func cellsRegisteration() {
        
        filterCollectionViewCell = String(describing: FilterCollectionViewCell.self)
        recipeTableViewCell = String(describing: RecipeTableViewCell.self)
        
        filterCollectionView.register(UINib(nibName: filterCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: filterCollectionViewCell)
        recipesTableView.register(UINib(nibName: recipeTableViewCell, bundle: nil), forCellReuseIdentifier: recipeTableViewCell)
    }
    
    func searchControllerConfiguration() {
        title = "Recipes Search"
        searchController = UISearchController(searchResultsController: SearchHistoryRouter().createModule())
        searchController.searchBar.placeholder = "Search..."
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        //change cancel button color
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = #colorLiteral(red: 0, green: 0.6889460357, blue: 0, alpha: 1)
        navigationItem.searchController = searchController
        
    }
}
extension RecipeSearchViewController: RecipeSearchViewProtocol
{
    func reloadData() {
        self.recipesTableView.reloadData()
    }
}
