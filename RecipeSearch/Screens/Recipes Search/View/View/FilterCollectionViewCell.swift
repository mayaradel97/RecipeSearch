//
//  FilterCollectionViewCell.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell, FilterCollectionViewCellProtocol {
    @IBOutlet weak var filterLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(filter: Filter) {
        filterLabel.text = filter.rawValue
    }
    
}
