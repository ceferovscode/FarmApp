//
//  DetailsController.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 10.03.24.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet private weak var productImage     : UIImageView!
    @IBOutlet private weak var nameLabel        : UILabel!
    @IBOutlet private weak var descriptionLabel : UITextView!
    
    var item: [MyList] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureData()
        
     }
    
    private func configureData() {
        self.nameLabel.text = item.first?.productName
        self.descriptionLabel.text = item.first?.shortdescription
        self.productImage.image = UIImage(data: item.first?.productImage ?? Data())
        // item.first?.productImage
     }
    


    private func configure() {
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func mailClicked(_ sender: Any) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MailController") as! MailController
        controller.item  = self.item
        navigationController?.show(controller, sender: nil)
        
    }
    
}


