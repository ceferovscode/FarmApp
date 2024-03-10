//
//  PhotoCell.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 08.03.24.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!

    
    func configureData(data: MyList) {
        nameLabel.text = data.productName
    }
    
    
    

}
