//
//  titleCoordinator.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 10.03.24.
//

import UIKit

class TitleCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func addClickedController () {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddController") as! AddController
        navigationController.show(controller, sender: nil)
    }
    
    func nextPageClicked () {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsController") as! DetailsController
        navigationController.show(controller, sender: nil)
    }
}
