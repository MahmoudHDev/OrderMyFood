//
//  HomeViewController.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var greetings       : UILabel!
    @IBOutlet weak var collectionView  : UICollectionView!
    
    var arrItems = ["Food", "Talabat mart", "Groceries", "Health & Wellness", "More Shops"]
    var arrItemImgs: [UIImage] = []
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConfig()
        addImages()
        updateUI()
    }
    
    
    //MARK:- Actions

    func addImages() {
        arrItemImgs.append(UIImage(named: "burger")!)
        arrItemImgs.append(UIImage(named: "market")!)
        arrItemImgs.append(UIImage(named: "shopping-bag")!)
        arrItemImgs.append(UIImage(named: "health")!)
        arrItemImgs.append(UIImage(named: "store")!)
        
    }
    
    
    func updateUI() {
        // Adding some styles
    }
    
    
}

