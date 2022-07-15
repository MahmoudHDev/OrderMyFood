//
//  Home+CollectionView.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/14/22.
//

import UIKit
//MARK:- CollectionView Delegate, Datasource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionViewConfig() {
        
        collectionView.delegate     = self
        collectionView.dataSource   = self
        collectionView.register(ItemsCollectionViewCell.nibConfig(), forCellWithReuseIdentifier:ItemsCollectionViewCell.cellId )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrItems.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemsCollectionViewCell.cellId, for: indexPath) as! ItemsCollectionViewCell
        
        cell.itemName.text = arrItems[indexPath.row]
        cell.itemImage.image = arrItemImgs[indexPath.row]
        
        return cell
    }
    
    
    
    
}
