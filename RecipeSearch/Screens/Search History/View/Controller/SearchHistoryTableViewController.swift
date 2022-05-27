//
//  SearchHistoryTableViewController.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit

class SearchHistoryTableViewController: UITableViewController {
    var presenter: SearchHistoryPresenter!
    private var searchHistoryCell: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellRegisteration()
       
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        presenter.getSearchHistory()
    }

    func cellRegisteration() {
        searchHistoryCell = String(describing: SearchHistoryTableViewCell.self)
        self.tableView.register(UINib(nibName: searchHistoryCell, bundle: nil), forCellReuseIdentifier: searchHistoryCell)
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return presenter.numberOfHistory
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: searchHistoryCell, for: indexPath) as? SearchHistoryTableViewCell
        else {
        return UITableViewCell()
        
       }
        presenter.configureSearchHistoryCell(cell: cell, indexPath: indexPath)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
extension SearchHistoryTableViewController: SearchHistoryViewProtocol
{
    func reloadData() {
        self.tableView.reloadData()
    }
}

