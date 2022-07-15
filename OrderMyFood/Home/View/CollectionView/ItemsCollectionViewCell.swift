//
//  ItemsCollectionViewCell.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/14/22.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Properties
    static let cellId = "cell"
    @IBOutlet weak var containerView    : UIView!
    @IBOutlet weak var itemImage        : UIImageView!
    @IBOutlet weak var itemName         : UILabel!

    //MARK:- Nib Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        itemName.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }

    
    //MARK:- Functions
    
    static func nibConfig () -> UINib {
        let nib = UINib(nibName: "ItemsCollectionViewCell", bundle: nil)
        
        return nib
    }

}
