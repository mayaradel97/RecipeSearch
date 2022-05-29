//
//  RecipeTableViewCell.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
import SDWebImage
class RecipeTableViewCell: UITableViewCell, RecipeTableViewCellProtocol {

    
  

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var recipeSourceLabel: UILabel!
    
    @IBOutlet weak var recipeHealthLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundedCelll()
        
    }
    func roundedCelll() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderWidth = 5
        self.layer.borderColor = #colorLiteral(red: 0.9547707805, green: 0.9547707805, blue: 0.9547707805, alpha: 1)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(recipe: RecipeData) {
        self.recipeTitleLabel.text = recipe.label
        self.recipeSourceLabel.text = recipe.source
        self.recipeHealthLabel.text = recipe.healthLabels.joined(separator: "  |  ")
        self.recipeImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.recipeImageView.sd_setImage(with: URL(string: recipe.image))
        
    }
    
}
