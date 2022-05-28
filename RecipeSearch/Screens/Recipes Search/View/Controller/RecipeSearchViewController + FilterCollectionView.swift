//
//  RecipeSearchViewController + FilterCollectionView.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import UIKit
extension RecipeSearchViewController : UICollectionViewDataSource
{
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfFilters
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCollectionViewCell, for: indexPath) as? FilterCollectionViewCell
       
       else {
        return UICollectionViewCell()
        }
//        filterCell.contentView.backgroundColor = nil
        print("cell \(indexPath.row)")
//        if currentSelectedFilter == 0
//        {
//            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
//        }
        filterCell.contentView.backgroundColor =  currentSelectedFilter == indexPath.row ? .lightGray : nil
        presenter.configureFilterCell(cell: filterCell,indexPath: indexPath)
        return filterCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.contentView.backgroundColor = nil
    }
}
extension RecipeSearchViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ded \(indexPath.row)")
        currentSelectedFilter = indexPath.row

        let filter =  presenter.getFilterName(at: indexPath)
        presenter.getRecipes(searchText: searchControllerText, filter: filter)
        //change color
       // collectionView.cellForItem(at: indexPath)?.contentView.backgroundColor = .lightGray
    }
}
extension RecipeSearchViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 120, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }

}
