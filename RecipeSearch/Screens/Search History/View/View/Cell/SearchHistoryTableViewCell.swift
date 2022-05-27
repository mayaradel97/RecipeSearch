//
//  SearchHistoryTableViewCell.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit

class SearchHistoryTableViewCell: UITableViewCell ,SearchHistoryTableViewCellProtocol{
   
    @IBOutlet weak var searchHistoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 
    func configure(searchHistoryText: String) {
        self.searchHistoryLabel.text = searchHistoryText
    }
    
}
