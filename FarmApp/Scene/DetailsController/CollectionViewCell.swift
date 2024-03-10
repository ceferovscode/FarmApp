//
//  CollectionViewCell.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 10.03.24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var productImage     : UIImageView!
    @IBOutlet private weak var nameLabel        : UILabel!
    @IBOutlet private weak var decriptionLabel  : UITextView!
    
    func configureData(data: MyList) {
        nameLabel.text = data.productName
        decriptionLabel.text = data.shortdescription
    }
    
}
